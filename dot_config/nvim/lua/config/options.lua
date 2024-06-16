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
opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"

-- context lines above/below + colorcolumn
opt.scrolloff = 20
opt.colorcolumn = "120"

-- fix allowed file naming
opt.isfname:append("@-@")

-- spell checking
opt.spelllang = { "en", "de" }
opt.spell = true

-- do not use system clipboard
opt.clipboard = ""

-- TODO: This is a workaround: https://github.com/folke/which-key.nvim/issues/584
if vim.env.SSH_TTY then
  local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
  }
end
