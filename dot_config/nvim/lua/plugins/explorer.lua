return {
  -- replacing neo-tree.nvim with yazi.nvim
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        "<C-_>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      open_for_directories = true,
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,
      open_multiple_tabs = true,
    },
  },
}
