-- add some more treesitter parser and delete some key mappings
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "ssh_config",
        "rust",
        "helm",
        "gotmpl",
        "csv",
      },
    },
  },
}
