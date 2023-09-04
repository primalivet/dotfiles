local ok, gitsigns = pcall(require, "lewis6991/gitsigns.nvim")

if not ok then
  return
end

gitsigns.setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "±" },
    untracked = { text = "" },
  },
})
