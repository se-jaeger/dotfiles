-- activate  and cofigure 'yanky' provided by lazyvim
return {
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
}
