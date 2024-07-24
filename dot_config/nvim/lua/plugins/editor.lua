return {
  -- neo-tree settings
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          never_show = {
            ".DS_Store",
          },
        },
      },
    },
  },

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
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts or {}, {
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        },
        float = {
          preview_split = "right",
        },
      })

      local oil = require("oil")
      oil.setup(opts)
      vim.keymap.set("n", "-", function()
        oil.open_float()
        oil.toggle_hidden()

        -- Wait until oil has opened, for a maximum of 1 second.
        vim.wait(1000, function()
          return oil.get_cursor_entry() ~= nil
        end)
        if oil.get_cursor_entry() then
          oil.open_preview()
        end
      end)
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
      leader_key = ";",
      buffer_leader_key = "m",
      separate_save_and_remove = true,
      index_keys = "asdfqwer1234",
      per_buffer_config = {
        lines = 5,
      },
    },
  },
}
