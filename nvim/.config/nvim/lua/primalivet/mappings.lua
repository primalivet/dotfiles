local M = {}

function M.init()
	local wk = require("which-key")
	local nvim_set_keymap = vim.api.nvim_set_keymap
	local default_opt = { noremap = true, silent = true }

	-- Go over wrapped lines
	nvim_set_keymap("n", "j", "gj", default_opt)
	nvim_set_keymap("n", "k", "gk", default_opt)

	-- Keep selection in visual mode when indenting
	nvim_set_keymap("v", "<", "<gv", default_opt)
	nvim_set_keymap("v", ">", ">gv", default_opt)

	-- Move lines in visual mode
	nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", default_opt)
	nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", default_opt)

	-- Edit
	wk.register({

		["["] = {
			name = "+Previous",
			["[C"] = { ":cfirst<CR>", "First in quickfix list" },
			["[L"] = { ":lfirst<CR>", "First in location list" },
			["[c"] = { ":cprevious<CR>", "Previous in quickfix list" },
			["[d"] = { ":lua vim.diagnostic.goto_prev()<CR>", "Previous diagnostic" },
			["[h"] = { ':lua require("gitsigns.actions").prev_hunk()<CR>', "Previous git hunk" },
			["[l"] = { ":lprevious<CR>", "Previous in location list" },
		},
		["]"] = {
			name = "+Next",
			["]C"] = { ":clast<CR>", "Last in quickfix list" },
			["]L"] = { ":llast<CR>", "Last in location list" },
			["]c"] = { ":cnext<CR>", "Next in quickfix list" },
			["]d"] = { ":lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
			["]h"] = { ':lua require("gitsigns.actions").next_hunk()<CR>', "Next git hunk" },
			["]l"] = { ":lnext<CR>", "Next in location list" },
		},
		["<leader>"] = {
			e = {
				name = "+Edit",
				a = { ":lua vim.lsp.buf.code_action()<CR>", "Code action at cursor" },
				f = { ":lua vim.lsp.buf.formatting()<CR>", "Format buffer" },
				r = { ":lua vim.lsp.buf.rename()<CR>", "Rename under cursor" },
				s = { ":'<,'>sort<CR>", "Sort visual selection", mode = "v" },
			},
			g = {
				name = "+Go to",
				-- TODO: show on cursor hold nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", default_opt)
				d = { ":lua vim.lsp.buf.definition()<CR>", "Go to definition" },
				f = { "gf", "Go to file" },
				h = { ":lua vim.lsp.buf.hover()<CR>", "Go to hover" },
				i = { ":lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
				r = { ":lua vim.lsp.buf.references()<CR>", "Go to references" },
				s = { ":lua vim.lsp.buf.signature_help()<CR>", "Go to signature help" },
				t = { ":lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
			},
			s = {
				name = "+Search",
				["/"] = { ":Lines<CR>", "Search lines" },
				b = { ":Buffers<CR>", "Search buffers" },
				c = { ":Commands<CR>", "Search commands" },
				f = { ":Files<CR>", "Search files" },
				g = { ":GitFiles<CR>", "Search git files" },
				h = { ":History<CR>", "Search history" },
				l = { ":Rg<CR>", "Search in project" },
			},
			t = {
				name = "+Toggle",
				l = { ":set list!<CR>", "Toggle invisiable charaters" },
				p = { ":set invpaste<CR>", "Toggle paste mode" },
				s = { ":nohlsearch<CR>", "Toggle search highlighting" },
			},
			c = {
				name = "+Config",
				c = { ":PackerCompile", "Config: compile" },
				r = { ":lua _G.reload_config()<CR>", "Config: reload" },
				s = { ":PackerSync<CR>", "Config: update and compile" },
			},
		},
	})
end

return M
