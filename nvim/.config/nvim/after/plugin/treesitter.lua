local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  playground = { enable = true },
  highlight = { enable = true },
  indent = { enable = true },
})
