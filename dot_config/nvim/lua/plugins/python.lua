return {
  -- DAP core dependencies
  { import = "lazyvim.plugins.extras.dap.core" },

  -- activate LayzVim's python extras
  { import = "lazyvim.plugins.extras.lang.python" },

  -- disable venv because it's I'm handling this outside of nvim
  { "linux-cultist/venv-selector.nvim", enabled = false },

  --  disable automatic dap installation because it skrews up my venv setup
  --  NOTE: make sure to install debugpy in the local venv to use debugger
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },

  -- activate and configure aerial to get a symbols tree
  { import = "lazyvim.plugins.extras.editor.aerial" },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        resize_to_content = true,
      },
      autojump = true,
      manage_folds = true,
      link_folds_to_tree = true,
      link_tree_to_folds = true,
    },
  },

  -- override which python is use for debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        -- using local venv python
        require("dap-python").setup("python")
      end,
    },
  },

  -- setup linting/formatting
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "mypy" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff", "mypy" },
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
}
