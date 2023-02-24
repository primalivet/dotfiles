return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
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
        highlight = {
          enable = true,
          disable = {'help'}
        },
        indent = { enable = true },
      })
    end,
  },
}
