-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- write (i.e., only when there are changes) file when switching somewhere else
-- ignore errors
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  command = ":silent! update",
})
