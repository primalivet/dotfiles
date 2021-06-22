local M = {}

local cmd = vim.api.nvim_command
local fn = vim.fn

local function packer_autoinstall()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_register()
  require'packer'.startup(function(use)

    -- TODO try lspsaga https://github.com/glepnir/lspsaga.nvim
    -- TODO try trouble https://github.com/folke/trouble.nvim
    -- TODO try lightbulb https://github.com/kosayoda/nvim-lightbulb

    use { 'wbthomason/packer.nvim' }
    use { 'editorconfig/editorconfig-vim' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-fugitive' }
    use { 'lifepillar/vim-colortemplate' }
    use { 'gerw/vim-HiLinkTrace' }
    use { 'gruvbox-community/gruvbox' }
    use { 'arzg/vim-colors-xcode' }
    use { '/mnt/c/Code/vim-brickor' }

    use { 'neovim/nvim-lspconfig',
          config = function() require'primalivet.plugins.lsp'.init() end }

    use { 'nvim-telescope/telescope.nvim',
          requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, { 'kyazdani42/nvim-web-devicons'}},
          config = function() require'primalivet.plugins.telescope'.init() end }

    use { 'hrsh7th/nvim-compe',
          config = function() require'primalivet.plugins.compe'.init() end }

    use { 'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate',
          config = function() require'primalivet.plugins.treesitter'.init() end }

    use { 'lewis6991/gitsigns.nvim',
          requires = { 'nvim-lua/plenary.nvim' },
          config = function() require'primalivet.plugins.gitsigns'.init() end }

    use { 'norcalli/nvim-colorizer.lua',
          config = function() require'primalivet.plugins.colorizer'.init() end }
  end)
end

function M.init()
  packer_autoinstall()
  packer_register()
end

return M
