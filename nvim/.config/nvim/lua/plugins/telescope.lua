return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git", "--glob", "!.stack-work" },
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
