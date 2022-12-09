local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_ok then
  return
end

treesitter.setup({
  playground = { enable = true },
  highlight = { enable = true },
  indent = { enable = true },
})
