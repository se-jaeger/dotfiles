return {
  -- DAP core dependencies
  { import = "lazyvim.plugins.extras.dap.core" },

  -- activate LazyVim's python extras
  { import = "lazyvim.plugins.extras.lang.python" },
  --
  -- disable venv because it's I'm handling this outside of nvim
  { "linux-cultist/venv-selector.nvim", enabled = false },

  --  disable automatic dap installation because it screws up my venv setup
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },

  -- use local venv python for debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      --  NOTE: make sure to install 'debugpy' in the local venv to use debugger
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup("python")
      end,
    },
  },

  -- setup linting/formatting
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "mypy", "ruff" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "mypy" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_fix", "ruff_format" },
      },
    },
  },

  -- jupyter notebook support
  -- NOTE: need the following packages installed in the local venv: 'pynvim', 'jupyter_client', 'jupytext'
  {
    -- converting ipynb <--> markdown on the fly
    "GCBallesteros/jupytext.nvim",
    opts = function(_)
      require("jupytext").setup({
        style = "markdown",
        output_extension = "md",
        force_ft = "markdown",
      })
    end,
  },

  {
    -- LSP support for markdown files
    "quarto-dev/quarto-nvim",
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        opts = {
          handle_leading_whitespace = true,
          lsp = {
            hover = { border = "none" },
          },
        },
      },
      {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          table.insert(opts.sources, {
            name = "otter",
          })
        end,
      },
    },
    ft = { "quarto", "markdown" },
    config = function()
      local quarto = require("quarto")
      quarto.setup({
        lspFeatures = {
          languages = { "python" },
          chunks = "all",
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          hover = "H",
          definition = "gd",
          rename = "<leader>cr",
          references = "gr",
          format = "<leader>cf",
        },
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
      })
      quarto.activate()
    end,
  },
  {
    -- run code interactively with the jupyter kernel
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    ft = { "quarto", "markdown" },
    dependencies = {
      -- register new prefix for notebook support
      "folke/which-key.nvim",
      optional = true,
      opts = {
        spec = {
          { "<leader>n", group = "notebooks" },
        },
      },
    },
    init = function()
      -- settings: https://github.com/benlubas/molten-nvim/tree/main?tab=readme-ov-file#configuration
      vim.g.molten_auto_open_output = false
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_wrap_output = true
      vim.g.molten_tick_rate = 150
      vim.g.molten_use_border_highlights = true
      vim.g.molten_enter_output_behavior = "open_and_enter"

      vim.api.nvim_create_autocmd("User", {
        pattern = "MoltenInitPost",
        callback = function()
          local runner = require("quarto.runner")
          vim.keymap.set("n", "<leader>nA", runner.run_all, { desc = "run all cells", silent = true })
          vim.keymap.set("n", "<leader>nc", function()
            runner.run_cell()
            vim.cmd("MoltenNext")
          end, { desc = "run and move to next cell", silent = true })
          vim.keymap.set("n", "<leader>nl", runner.run_line, { desc = "run line", silent = true })
          vim.keymap.set("n", "<leader>na", runner.run_above, { desc = "run cell and above", silent = true })
          vim.keymap.set("n", "<leader>nb", runner.run_below, { desc = "run cell and below", silent = true })
          vim.keymap.set(
            "n",
            "<leader>no",
            ":noautocmd MoltenEnterOutput<CR>",
            { desc = "open and enter output window", silent = true }
          )
          vim.keymap.set("n", "<leader>nq", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
          vim.keymap.set("n", "<leader>nR", ":MoltenRestart<CR>", { desc = "restart kernel", silent = true })
          vim.keymap.set("n", "<leader>nI", ":MoltenInterrupt<CR>", { desc = "interrupt kernel", silent = true })
          vim.keymap.set("n", "<leader>nD", ":MoltenDelete<CR>", { desc = "delete cell output", silent = true })
        end,
      })

      -- automatically import output chunks from a jupyter notebook
      -- tries to find a kernel that matches the kernel in the jupyter notebook
      -- falls back to a kernel that matches the name of the active venv (if any)
      local imb = function(e) -- init molten buffer
        vim.schedule(function()
          local kernels = vim.fn.MoltenAvailableKernels()
          local try_kernel_name = function()
            local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
            return metadata.kernelspec.name
          end
          local ok, kernel_name = pcall(try_kernel_name)
          if not ok or not vim.tbl_contains(kernels, kernel_name) then
            kernel_name = nil
            local venv = os.getenv("VIRTUAL_ENV")
            if venv ~= nil then
              kernel_name = string.match(venv, "/.+/(.+)")
            end
          end
          if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
            vim.cmd(("MoltenInit %s"):format(kernel_name))
          end
          vim.cmd("MoltenImportOutput")
        end)
      end

      -- automatically import output chunks from a jupyter notebook
      vim.api.nvim_create_autocmd("BufAdd", {
        pattern = { "*.ipynb" },
        callback = imb,
      })

      -- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.ipynb" },
        callback = function(e)
          if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
            imb(e)
          end
        end,
      })

      -- automatically export output chunks to a jupyter notebook on write
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.ipynb" },
        callback = function()
          if require("molten.status").initialized() == "Molten" then
            vim.cmd("MoltenExportOutput!")
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      textobjects = {
        move = {
          goto_next_start = {
            ["]j"] = { query = "@code_cell.inner", desc = "Next code cell" },
          },
          goto_previous_start = {
            ["[j"] = { query = "@code_cell.inner", desc = "Previous code cell" },
          },
        },
        select = {
          enable = true,
          keymaps = {
            ["ij"] = { query = "@code_cell.inner", desc = "In code cell" },
            ["aj"] = { query = "@code_cell.outer", desc = "Around code cell" },
          },
        },
      },
    },
  },
}
