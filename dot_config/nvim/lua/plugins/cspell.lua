-- Use cspell for spelling
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "cspell" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft["*"] = opts.linters_by_ft["*"] or {}
      vim.list_extend(opts.linters_by_ft["*"], { "cspell" })
      vim.list_extend(require("lint").linters.cspell.args, { "--config", "~/.config/cspell/config.yaml" })

      vim.api.nvim_create_user_command(
        "AddWordToDictionary",
        "!echo '<cword>' >> ~/.config/cspell/custom-words.txt",
        { desc = "Add word under curser to cspell's custom-words list" }
      )
    end,
  },
}
