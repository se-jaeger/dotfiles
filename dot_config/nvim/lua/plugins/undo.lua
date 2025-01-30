return {
  -- highlight-undo
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      duration = 3000,
    },
  },
  -- undotree
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>fu", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", { desc = "Open Undotree" })
    end,
  },
}
