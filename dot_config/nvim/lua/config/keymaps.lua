-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set({ "i", "v" }, "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- vertical movements
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center cursor" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center cursor" })
keymap.set("n", "n", "nzzzv", { desc = "Find next and center cursor" })
keymap.set("n", "N", "Nzzzv", { desc = "Find previous and center cursor" })

-- maxmimize/equalize window size
keymap.set({ "n", "v" }, "<leader>wm", "<C-w>|<C-w>_", { desc = "Maximize window" })
keymap.set({ "n", "v" }, "<leader>we", "<C-w>=", { desc = "Equalize window sizes" })

-- yank to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
