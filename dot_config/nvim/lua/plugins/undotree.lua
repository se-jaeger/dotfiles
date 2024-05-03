-- add 'undotree' to browse file history
return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>fu", "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>", { desc = "Open Undotree" })
  end,
}
