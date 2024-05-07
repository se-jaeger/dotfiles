-- activate 'yanky' provided by lazyvim and use it for autocompletion
return {
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    "gbprod/yanky.nvim",
    opts = function(_, opts)
      vim.tbl_deep_extend("force", opts, {
        ring = {
          history_length = 10000,
        },
        system_clipboard = {
          sync_with_ring = false,
        },
        picker = {
          telescope = {
            mappings = {
              i = {
                -- TODO: This worked already... But now it's broken again..
                ["<c-k>"] = require("telescope.actions").move_selection_previous,
              },
            },
          },
        },
      })
    end,
    {
      "hrsh7th/nvim-cmp",
      dependencies = { "chrisgrieser/cmp_yanky" },
      opts = function(_, opts)
        table.insert(opts.sources, {
          name = "cmp_yanky",
        })
      end,
    },
  },
}
