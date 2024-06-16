local vault_path = vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain/"

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vault_path .. "**.md",
    "BufNewFile " .. vault_path .. "**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "second-brain",
        path = vault_path,
      },
    },
    notes_subdir = "0-inbox",
    new_notes_location = "notes_subdir",
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    attachments = {
      img_folder = "attachments",
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
    note_path_func = function(spec)
      local title = ""
      if spec.title ~= nil then
        title = spec.title
      else
        title = "Untitled-"
        for _ = 1, 4 do
          title = title .. string.char(math.random(65, 90))
        end
      end

      local path = spec.dir / title
      return path:with_suffix(".md")
    end,
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,
  },
}
