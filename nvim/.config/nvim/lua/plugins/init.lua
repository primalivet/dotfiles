return {
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  { "EdenEast/nightfox.nvim", config = function()
    -- require('nightfox').setup({})
    if tonumber(vim.api.nvim_call_function('system', {'date "+%H"'})) >= 16 then
      vim.cmd[[colorscheme nightfox]]
    else
      vim.cmd[[colorscheme dayfox]]
    end
  end}
}
