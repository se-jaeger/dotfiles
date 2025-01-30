return {
  -- arrow
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = {
      save_path = function()
        return vim.fn.stdpath("state") .. "/arrow"
      end,
      mappings = {
        open_vertical = "|",
      },
      leader_key = "<leader>j",
      buffer_leader_key = "<leader>J",
      separate_save_and_remove = true,
      per_buffer_config = {
        lines = 11,
      },
    },
  },
}
