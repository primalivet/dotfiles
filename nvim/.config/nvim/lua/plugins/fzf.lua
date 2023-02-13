return {
  {
    "junegunn/fzf",
    dependencies = "junegunn/fzf.vim",
    config = function()
      vim.g.fzf_layout = { down = "30%" }
      vim.g.fzf_preview_window = {}
      vim.g.fzf_action = { ["ctrl-x"] = "split", ["ctrl-v"] = "vsplit" }
    end,
  },
}
