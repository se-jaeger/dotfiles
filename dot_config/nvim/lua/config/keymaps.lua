-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set({ "i", "v" }, "jk", "<ESC>", { desc = "Exit insert/visual mode with jk" })

-- vertical movements
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center cursor" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center cursor" })

-- yank to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })

-- amplified versions of hjkl
vim.keymap.set("n", "jj", "6j", { desc = "Move 6 lines down" })
vim.keymap.set("n", "kk", "6k", { desc = "Move 6 lines up" })
vim.keymap.set("n", "hh", "0^", { desc = "Move to first non blank char in line" })
vim.keymap.set("n", "ll", "$", { desc = "Move to last char in line" })

-- don't pollute register from too short entries
vim.keymap.set("n", "dd", function()
  if string.len(vim.fn.getline("."):match("^%s*(.*%S)") or "") < 5 then
    return '"_dd'
  end
  return "dd"
end, { expr = true })
vim.keymap.set("n", "x", '"_x')
