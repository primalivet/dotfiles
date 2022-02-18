local M = {}
local fn = vim.fn

function M.init()
	-- Bootstrap
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	end

	local packer = require("packer")
	local use = packer.use
	-- Initialize
	packer.init()

	-- Load packages
	use("kyazdani42/nvim-web-devicons")
	use("wbthomason/packer.nvim")
	use("editorconfig/editorconfig-vim")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("gerw/vim-HiLinkTrace")
  use("rafcamlet/nvim-luapad")

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use({
		"TimUntersberger/neogit",
		requires = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("diffview.config").setup({
				use_icons = true,
			})
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
		end,
	})

	use({
		"junegunn/fzf",
		requires = { "junegunn/fzf.vim" },
		config = function()
			vim.g.fzf_layout = { down = "30%" }
			vim.g.fzf_preview_window = {}
			vim.g.fzf_action = {
				["ctrl-q"] = function(lines)
					local items = {}
					for _, line in ipairs(lines) do
						table.insert(items, { filename = line })
					end
					vim.fn.setqflist(items, " ", { title = "Search results", id = "FZF Search Results" })
				end,
				["ctrl-x"] = "split",
				["ctrl-v"] = "vsplit",
			}
			vim.cmd([[
            augroup UserFZF!
                autocmd! FileType fzf
                autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
                  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
            augroup END
            ]])

			if vim.fn.isdirectory("~/Code/OSS/dotfiles") then
				vim.cmd("command! Dotfiles FZF ~/Code/OSS/dotfiles")
			end
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
		config = function()
			local telescope = require("telescope")
			local picker_defaults = {
				theme = "ivy",
				previewer = false,
				layout_config = {
					height = 0.4,
				},
				border = false,
			}

			telescope.load_extension("fzf")

			telescope.setup({
				pickers = {
					commands = picker_defaults,
					find_files = picker_defaults,
					git_files = picker_defaults,
					live_grep = picker_defaults,
					current_buffer_fuzzy_find = picker_defaults,
					buffers = picker_defaults,
				},
			})
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			require("cmp").setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				sources = {
					{ name = "buffer" },
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "emoji" },
					{ name = "nvim_lsp_signature_help" },
				},
			})
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "±" },
				},
			})
			vim.cmd("command! ResetHunk Gitsigns reset_hunk")
			vim.cmd("command! PreviewHunk Gitsigns preview_hunk")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = { "nvim-treesitter/playground" },
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		requires = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
		config = function()
			local nvim_lsp = require("lspconfig")

			do
				local method_name = "textDocument/publishDiagnostics"
				local default_handler = vim.lsp.handlers[method_name]
				vim.lsp.handlers[method_name] = function(err, method, result, client_id, bufnr, config)
					default_handler(err, method, result, client_id, bufnr, config)
					vim.diagnostic.setloclist({ open = false })
				end
			end
			--
			-- Generic "On attach" function for all language servers
			--
			local function on_attach(client)
				-- Disable formatting for any language server
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false

				if client.name == "tsserver" then
					local ts_utils = require("nvim-lsp-ts-utils")
					ts_utils.setup({
						always_organize_imports = false,
						filter_out_diagnostics_by_severity = { "hint" },
					})
					ts_utils.setup_client(client)
				end
			end

			--
			-- LSP Setups
			--

			-- CSS, JSON and YAML LSP
			-- Capabilities are not resolved in on_attach as that is the servers
			-- capabilities, here we need to set neovims capabilities.
			-- Please tell me why it is this way???
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			nvim_lsp.tsserver.setup({
				init_options = require("nvim-lsp-ts-utils").init_options,
				on_attach = on_attach,
			})

			nvim_lsp.cssls.setup({
				capabilities = capabilities,
			})

			-- Sumneko LSP
			if vim.fn.has("mac") == 1 or vim.fn.has("linux") == 1 then
				-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
				USER = vim.fn.expand("$USER")

				local sumneko_root_path = ""
				local sumneko_binary = ""

				if vim.fn.has("mac") == 1 then
					sumneko_root_path = "/Users/" .. USER .. "/.local/lua-language-server"
					sumneko_binary = "/Users/" .. USER .. "/.local/lua-language-server/bin/macOS/lua-language-server"
				elseif vim.fn.has("unix") == 1 then
					sumneko_root_path = "/home/" .. USER .. "/.local/lua-language-server"
					sumneko_binary = "/home/" .. USER .. "/.local/lua-language-server/bin/Linux/lua-language-server"
				end

				nvim_lsp.sumneko_lua.setup({
					cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
					settings = {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
								-- Setup your lua path
								path = vim.split(package.path, ";"),
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
							workspace = {
								-- Make the server aware of Neovim runtime files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								},
							},
						},
					},
				})
			end
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			local opts = {
				-- Run eslint (formatting) if no prettier config exists but
				-- eslint config does exist
				eslint_formatting = {
					condition = function(utils)
						local has_eslint = utils.root_has_file(".eslintrc") or utils.root_has_file(".eslintrc.json")
						local has_prettier = utils.root_has_file(".prettierrc")
							or utils.root_has_file(".prettierrc.json")

						return has_eslint and not has_prettier
					end,
				},
				-- Run eslint if eslint config file exists
				eslint_diagnostics = {
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc", ".eslintrc.json" })
					end,
				},
				-- Run prettier if prettier config exitst
				prettier_formatting = {
					condition = function(utils)
						return utils.root_has_file({ ".prettierrc", ".prettierrc.json" })
					end,
				},
				stylua_formatting = {
					condition = function(utils)
						return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
					end,
				},
			}

			require("null-ls").setup({
				debug = true,
				sources = {
					null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
					null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
					null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
					null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
				},
				on_attach = function(client)
					if client.resolved_capabilities.document_formatting then
						vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
						vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
					end
				end,
			})
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
		"~/Code/OSS/cabin.nvim",
		condition = function()
			vim.fn.isdirectory("~/Code/OSS/cabin.nvim")
			vim.cmd([[colorscheme cabin]])
		end,
		config = function() end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup({
				window = {
					margin = { 0, 0, 0, 0 },
				},
			})
		end,
	})
end

return M
