return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    require("oil").setup({
      delete_to_trash = true,
    })

    vim.keymap.set("n", "-", "<CMD>:Oil<CR>", { desc = "Open parent directory" })
  end,
}
