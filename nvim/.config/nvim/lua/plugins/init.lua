return {
  { "junegunn/fzf", dependencies = "junegunn/fzf.vim" },
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
}
