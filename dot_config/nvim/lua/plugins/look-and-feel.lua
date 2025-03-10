return {
  -- add gruvbox
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

  -- scrollEOF
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = { insert_mode = true },
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

  -- beacon
  { "danilamihailov/beacon.nvim" },
}
