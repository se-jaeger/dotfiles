return {
  -- codecompanion.nvim
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
      {
        "saghen/blink.cmp",
        dependencies = { "olimorris/codecompanion.nvim" },
        opts = {
          sources = {
            default = { "codecompanion" },
          },
        },
      },
      {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
          table.insert(
            opts.sections.lualine_x,
            2,
            LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
              --TODO: adapt this for CodeCompanion
              -- local clients = package.loaded["copilot"] and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 })
              --   or {}
              -- if #clients > 0 then
              --   local status = require("copilot.api").status.data.status
              --   return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
              -- end
              return "ok"
            end)
          )
        end,
      },
    },
    opts = {
      adapters = {
        lm_studio = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://127.0.0.1:1234",
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "lm_studio",
        },
        inline = {
          adapter = "lm_studio",
        },
        cmd = {
          adapter = "lm_studio",
        },
      },
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>ac",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Toggle AI Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>an",
        "<cmd>CodeCompanionChat<cr>",
        desc = "New AI Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>ag",
        "<cmd>CodeCompanionChat Add<cr>",
        desc = "Add to AI Chat",
        mode = "v",
      },
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions<cr>",
        desc = "AI Actions",
        mode = { "n", "v" },
      },
      {
        "<leader>af",
        "<cmd>CodeCompanion /fix<cr>",
        desc = "Ask AI to fix code",
        mode = "v",
      },
      {
        "<leader>ae",
        "<cmd>CodeCompanion /fix<cr>",
        desc = "Ask AI to explain code",
        mode = "v",
      },
    },
  },
}
