local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not ok then
  return
end

treesitter_configs.setup({
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
    disable = { "help" },
  },
  indent = { enable = true },
})
