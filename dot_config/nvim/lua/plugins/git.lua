return {
  { import = "lazyvim.plugins.extras.lang.git" },

  -- advanced git search
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    dependencies = {
      "ibhagwan/fzf-lua",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("advanced_git_search.fzf").setup({
        diff_plugin = "diffview",
      })
    end,
    keys = {
      { "<leader>gf", ":AdvancedGitSearch search_log_content_file<CR>", desc = "Current File History" },
      { "<leader>gF", ":AdvancedGitSearch search_log_content<CR>", desc = "Search Git History for File Content" },
    },
  },

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = "eol",
      },
    },
  },
}
