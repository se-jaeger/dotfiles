-- activate 'yanky' provided by lazyvim
return {
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    "gbprod/yanky.nvim",
    opts = {
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
              ["<c-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      },
    },
  },
}
