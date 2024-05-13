-- change colorscheme
return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  {
    "f4z3r/gruvbox-material.nvim",
    opts = {
      contrast = "hard",
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
