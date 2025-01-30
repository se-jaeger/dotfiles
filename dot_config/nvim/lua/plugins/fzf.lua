return {
  -- fzf-lua
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local fzf = require("fzf-lua")
      local config = fzf.config
      local actions = fzf.actions

      opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
        -- neovim `:tmap` mappings for the fzf win
        builtin = {
          true, -- inherit default mappings
          ["<c-d>"] = "preview-page-down",
          ["<c-u>"] = "preview-page-up",
        },
        -- fzf '--bind=' options
        fzf = {
          true, -- inherit default mappings
          ["ctrl-d"] = false,
          ["ctrl-u"] = false,
        },
      })
      opts.files = vim.tbl_deep_extend("force", opts.files or {}, {
        actions = {
          ["ctrl-i"] = { actions.toggle_ignore },
          ["ctrl-h"] = { actions.toggle_hidden },
          ["alt-i"] = false,
          ["alt-h"] = false,
        },
      })
      opts.grep = vim.tbl_deep_extend("force", opts.grep or {}, {
        actions = {
          ["alt-i"] = false,
          ["alt-h"] = false,
        },
      })
      return opts
    end,
  },
}
