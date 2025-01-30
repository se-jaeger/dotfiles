return {
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
