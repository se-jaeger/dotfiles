return {
  -- harpoon
  { import = "lazyvim.plugins.extras.editor.harpoon2" },

  -- yanky
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    "gbprod/yanky.nvim",
    opts = function(_, opts)
      opts.ring = opts.ring or {}
      opts.ring.history_length = 10000

      opts.system_clipboard = {
        sync_with_ring = false,
      }

      opts.picker = {
        telescope = {
          mappings = {
            i = {
              ["<c-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      }
    end,
  },

  --scrollEOF
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = { insert_mode = true },
  },

  -- mini-surround
  { import = "lazyvim.plugins.extras.coding.mini-surround" },

  -- highlight-undo
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      duration = 3000,
    },
  },

  -- oil
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      require("oil").setup({
        delete_to_trash = true,
      })

      vim.keymap.set("n", "-", "<CMD>:Oil<CR>", { desc = "Open parent directory" })
    end,
  },

  -- aerial
  { import = "lazyvim.plugins.extras.editor.aerial" },
  {
    "stevearc/aerial.nvim",
    opts = {
      autojump = true,
      manage_folds = true,
      link_folds_to_tree = true,
      link_tree_to_folds = true,
      open_automatic = function(bufnr)
        local aerial = require("aerial")
        -- Enforce a minimum line count
        return vim.api.nvim_buf_line_count(bufnr) > 40
          -- Enforce a minimum symbol count
          and aerial.num_symbols(bufnr) > 2
          -- A useful way to keep aerial closed when closed manually
          and not aerial.was_closed()
      end,
    },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
      },
    },
  },

  -- undotree
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>fu", "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>", { desc = "Open Undotree" })
    end,
  },

  -- zen-mode
  {
    -- NOTE: alternative - https://github.com/shortcuts/no-neck-pain.nvim/wiki/Showcase#right-padding-only
    "folke/zen-mode.nvim",
    dependencies = {
      {
        "folke/twilight.nvim",
        opts = {},
      },
    },
    opts = {},
  },

  -- replacer
  { "nvim-pack/nvim-spectre", enabled = false },
  {
    "gabrielpoca/replacer.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("replacer").run()
        end,
        desc = "Make Quickfix Window Editable",
      },
    },
  },

  -- neogen
  {
    "danymat/neogen",
    version = "*",
    config = function()
      require("neogen").setup({
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
        },
      })

      vim.api.nvim_set_keymap(
        "n",
        "<Leader>cg",
        ":lua require('neogen').generate()<CR>",
        { noremap = true, silent = true, desc = "Generate DocString" }
      )
    end,
  },
}
