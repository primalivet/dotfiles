return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "css",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "rust",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      playground = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
