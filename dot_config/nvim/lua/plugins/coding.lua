return {
  -- aerial
  { import = "lazyvim.plugins.extras.editor.aerial" },
  {
    "stevearc/aerial.nvim",
    opts = {
      autojump = true,
      manage_folds = true,
      link_folds_to_tree = true,
      link_tree_to_folds = true,
      close_on_select = true,
      layout = {
        min_width = { 20, 0.1 },
        resize_to_content = true,
      },
    },
  },

  -- neogen
  {
    "danymat/neogen",
    version = "*",
    config = function()
      require("neogen").setup({
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
        },
      })

      vim.api.nvim_set_keymap(
        "n",
        "<Leader>cg",
        ":lua require('neogen').generate()<CR>",
        { noremap = true, silent = true, desc = "Generate DocString" }
      )
    end,
  },

  -- todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    opts = {
      search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
      highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
    },
  },

  -- mini-surround
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
}
