-- scroll off at the end of line base on the 'scrolloff' option
return {
  "Aasim-A/scrollEOF.nvim",
  event = { "CursorMoved", "WinScrolled" },
  opts = { insert_mode = true },
}
