-- Change auto completion behavior.
-- Use TAB to accept the first and C-j/C-k to cycle through suggestions
return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local compare = require("cmp.config.compare")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-10),
        ["<C-d>"] = cmp.mapping.scroll_docs(10),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      opts.mapping["<CR>"] = nil -- this need to be outside of the above 'tbl_extend' to override it.

      opts.sorting = vim.tbl_extend("force", opts.sorting, {
        comparators = {
          compare.offset, -- Entries with smaller offset will be ranked higher.
          compare.recently_used, -- Entries that are used recently will be ranked higher.
          compare.score, -- Entries with higher score will be ranked higher.
          compare.exact, -- Entries with exact == true will be ranked higher.
          compare.scopes, --  Entries defined in a closer scope will be ranked higher (e.g., prefer local variables to globals).
          compare.kind, -- Entires with smaller ordinal value of 'kind' (type of completion) will be ranked higher.
          compare.locality, -- Entries with higher locality (i.e., words that are closer to the cursor)
          -- compare.sort_text, -- Entries will be ranked according to the lexicographical order of sortText.
          compare.length, -- Entires with shorter label length will be ranked higher.
          -- compare.order, -- Entries with smaller id will be ranked higher.
        },
      })

      opts.completion = vim.tbl_extend("force", opts.completion, {
        keyword_length = 3,
      })
    end,
  },
}
