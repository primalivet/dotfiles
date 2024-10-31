-- TODO: check if treesitter package exists
require"nvim-treesitter.configs".setup {
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true }
}
