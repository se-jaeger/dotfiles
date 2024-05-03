-- make quickfix windows editable
return {
  -- disable spectre in favour of replacer
  { "nvim-pack/nvim-spectre", enabled = false },

  {
    "gabrielpoca/replacer.nvim",
    keys = {
      {
        "<leader>x",
        function()
          require("replacer").run()
        end,
        desc = "Make Quickfix Window Editable",
      },
    },
  },
}
