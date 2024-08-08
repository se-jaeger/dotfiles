-- change 'telescope' key mappings
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      path_display = { "smart" },
      mappings = {
        i = {
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
        },
      },
    },
    pickers = {
      find_files = {
        find_command = { "fd", "--type", "file", "--color", "never", "--exclude", ".git", "--exclude", "target" },
      },
    },
  },
}
