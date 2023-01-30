return {
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  { "EdenEast/nightfox.nvim", config = function()
    -- require('nightfox').setup({})
    vim.cmd[[colorscheme dayfox]]
  end}
}
