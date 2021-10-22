local M = {}

local cmd = vim.api.nvim_command
local fn = vim.fn
function M.init()
	-- Bootstrap
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	end

	local packer = require'packer'
	local use = packer.use

	-- Initialize
	packer.init()

	-- Load packages
	use 'wbthomason/packer.nvim'
	use 'editorconfig/editorconfig-vim'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-fugitive'

	use {
          'nvim-telescope/telescope.nvim',
          requires = {
                  'nvim-lua/popup.nvim',
                  'nvim-lua/plenary.nvim'
          }
  }

	use {
          'hrsh7th/nvim-cmp',
          requires = {
                  'hrsh7th/vim-vsnip',
                  'hrsh7th/cmp-buffer',
                  'hrsh7th/cmp-nvim-lua',
                  'hrsh7th/cmp-nvim-lsp',
                  'hrsh7th/cmp-path',
                  'hrsh7th/cmp-emoji'
          },
          config = function()
                  require'cmp'.setup {
                          snippet = {
                                  expand = function(args)
                                          vim.fn["vsnip#anonymous"](args.body)
                                  end
                          },
                          formatting = {
                                  format = function(entry, vim_item)
                                          vim_item.menu =
                                          ({
                                                  buffer = "[Buffer]",
                                                  path = "[Path]",
                                                  nvim_lsp = "[LSP]",
                                                  nvim_lua = "[Lua]",
                                                  emoji = "[Emoji]"
                                          })[entry.source.name]
                                          return vim_item
                                  end
                          },
                          sources = {
                                  {name = "buffer"},
                                  {name = "path"},
                                  {name = "nvim_lsp"},
                                  {name = "nvim_lua"},
                                  {name = "emoji"}
                          }
                  }
          end
  }

	use {
          'lewis6991/gitsigns.nvim',
          requires = { 'nvim-lua/plenary.nvim' },
          config = function()
                  require'gitsigns'.setup{
                          signs = {
                                  add = { text = '+' },
                                  change = { text = '~' },
                                  delete = { text = '_' },
                                  topdelete = { text = '‾' },
                                  changedelete = { text = '±' }
                          }
                  }
                  vim.cmd "command! GitsignsResetHunk exe 'Gitsigns reset_hunk'"
                  vim.cmd "command! GitsignsNextHunk exe 'Gitsigns next_hunk'"
                  vim.cmd "command! GitsignsPrevHunk exe 'Gitsigns prev_hunk'"
                  vim.cmd "command! GitsignsPreviewHunk exe 'Gitsigns preview_hunk'"
          end
  }

	use {
          'neovim/nvim-lspconfig',
          requires = {
          },
          config = function()
                  -- Integrate quickfix list with the nvim lsp
                  do
                          local lsp_method = "textDocument/publishDiagnostics"
                          local default_handler = vim.lsp.handlers[lsp_method]
                          vim.lsp.handlers[lsp_method] = function(err, method, result, client_id, bufnr, config)
                                  default_handler(err, method, result, client_id, bufnr, config)
                                  local diagnostics = vim.lsp.diagnostic.get_all()
                                  local items = vim.lsp.util.diagnostics_to_items(diagnostics)

                                  vim.lsp.util.set_loclist(items)
                          end
                  end

                  -- Load language servers
                  -- TODO: lsp "native" eslint
                  require("primalivet.plugins.lsp.sumneko").init()
                  require("primalivet.plugins.lsp.vimls").init()
                  require("primalivet.plugins.lsp.tsserver").init()
                  require("primalivet.plugins.lsp.jsonls").init()
          end
  }


	-- use {"heavenshell/vim-jsdoc", run = "make install", ft = {"javascript", "javascript.jsx", "typescript"}}
	-- use {"windwp/nvim-ts-autotag"}
	-- use { "windwp/nvim-autopairs", requires = "nvim-treesitter/nvim-treesitter", config = function() require "primalivet.plugins.autopairs".init() end }
	-- use {"ray-x/lsp_signature.nvim", requires = {"neovim/nvim-lspconfig"}}
	-- use { "sindrets/diffview.nvim", config = function() require "primalivet.plugins.diffview".init() end }
	-- use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = {"markdown"}}
	-- use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function() require "primalivet.plugins.treesitter".init() end }
	-- use { "nvim-treesitter/playground", requires = {{"nvim-treesitter/nvim-treesitter"}}, config = function() require "primalivet.plugins.treesitter-playground".init() end }
	-- use {"jose-elias-alvarez/null-ls.nvim", requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}}
	-- use { "neovim/nvim-lspconfig", config = function() require "primalivet.plugins.lsp".init() end }
	-- use { "jose-elias-alvarez/nvim-lsp-ts-utils", requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim"} }
	-- use {"simrat39/symbols-outline.nvim"}
end

return M
