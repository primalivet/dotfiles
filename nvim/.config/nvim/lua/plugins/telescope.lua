return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local height = vim.api.nvim_win_get_height(0)
    telescope.setup({
      -- defaults = {
      --   layout_strategy = "bottom_pane",
      --   layout_config = { bottom_pane = { height = height } },
      --   sorting_strategy = "ascending",
      --   winblend = 0,
      --   border = false,
      -- },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git", "--glob", "!.stack-work" },
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
