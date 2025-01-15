return {
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

  -- replacing neo-tree.nvim with yazi.nvim
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        "<C-_>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      open_for_directories = true,
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,
      open_multiple_tabs = true,
    },
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
      close_on_select = true,
      layout = {
        min_width = { 20, 0.1 },
        resize_to_content = true,
      },
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
      vim.keymap.set("n", "<leader>fu", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", { desc = "Open Undotree" })
    end,
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

  -- arrow
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = {
      save_path = function()
        return vim.fn.stdpath("state") .. "/arrow"
      end,
      mappings = {
        open_vertical = "|",
      },
      leader_key = "L",
      buffer_leader_key = "M",
      separate_save_and_remove = true,
      per_buffer_config = {
        lines = 11,
      },
    },
  },

  -- todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    opts = {
      search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
      highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
    },
  },

  -- dial.nvim
  { import = "lazyvim.plugins.extras.editor.dial" },

  -- inc-rename
  { import = "lazyvim.plugins.extras.editor.inc-rename" },
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = { inc_rename = true },
    },
  },
}
