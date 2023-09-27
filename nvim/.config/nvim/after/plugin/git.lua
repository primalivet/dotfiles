local ok, gitsigns = pcall(require, "gitsigns")

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
