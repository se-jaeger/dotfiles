-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- don't use swap/backup but undofile
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

-- context lines above/below + colorcolumn
opt.scrolloff = 20
opt.colorcolumn = "120"

-- fix allowed file naming
opt.isfname:append("@-@")

-- spell checking
opt.spell = true
opt.spelllang = { "en_us", "de_de" }

-- do not use system clipboard
opt.clipboard = ""
