return {
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  {
    dir = "~/Code/OSS/cabin.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cabin").setup()
      vim.cmd([[colorscheme cabin]])
    end,
  },
  { "nvim-lualine/lualine.nvim", opts = {} },
}
