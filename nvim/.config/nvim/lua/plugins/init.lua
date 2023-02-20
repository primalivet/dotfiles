return {
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  "uga-rosa/ccc.nvim",
  {
    dir = "~/Code/OSS/cabin.nvim",
    config = function()
      require("cabin").setup({})
      vim.opt.background = "dark"
      vim.cmd([[colorscheme cabin]])
    end,
  },
}
