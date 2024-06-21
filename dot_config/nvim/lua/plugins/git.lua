return {
  -- advanced git search
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("advanced_git_search")
    end,
    -- TODO: add other mappings and setup <CR> to open diff somehow...
    keys = {
      { "<leader>gf", ":AdvancedGitSearch search_log_content_file<CR>", desc = "Current File History" },
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
