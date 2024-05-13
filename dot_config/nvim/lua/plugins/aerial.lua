return {
  -- activate and configure aerial to get a symbols tree
  { import = "lazyvim.plugins.extras.editor.aerial" },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        resize_to_content = true,
      },
      autojump = true,
      manage_folds = true,
      link_folds_to_tree = true,
      link_tree_to_folds = true,
      open_automatic = function(bufnr)
        local aerial = require("aerial")
        -- Enforce a minimum line count
        return vim.api.nvim_buf_line_count(bufnr) > 40
          -- Enforce a minimum symbol count
          and aerial.num_symbols(bufnr) > 2
          -- A useful way to keep aerial closed when closed manually
          and not aerial.was_closed()
      end,
    },
  },
}
