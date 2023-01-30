return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local width = vim.api.nvim_win_get_width(0)
    local height = math.floor(vim.api.nvim_win_get_height(0) / 2)
    telescope.setup({
      defaults = {
        layout_strategy = "bottom_pane",
        layout_config = { prompt_position = "top", width = width, height = height },
        sorting_strategy = "ascending",
        winblend = 0,
        border = true,
        borderchars = {
          prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
          results = { " ", " ", " ", " ", " ", " ", " ", " " },
          preview = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
