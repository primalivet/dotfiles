require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = true, auto_refresh = true },
})
