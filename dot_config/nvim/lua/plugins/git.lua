return {
  -- advanced git search
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          advanced_git_search = {
            diff_plugin = "diffview",
          },
        },
      })
      require("telescope").load_extension("advanced_git_search")
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
