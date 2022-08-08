local default_opt = { noremap = true, silent = true }

-- Go over wrapped lines
vim.api.nvim_set_keymap("n", "j", "gj", default_opt)
vim.api.nvim_set_keymap("n", "k", "gk", default_opt)

-- Keep selection in visual mode when indenting
vim.api.nvim_set_keymap("v", "<", "<gv", default_opt)
vim.api.nvim_set_keymap("v", ">", ">gv", default_opt)

-- Move lines in visual mode
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", default_opt)
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", default_opt)

-- Copilot (default to Tab for completion)
vim.api.nvim_set_keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", default_opt)
vim.api.nvim_set_keymap("i", "<C-[>", "<Plug>(copilot-previous)", default_opt)
vim.api.nvim_set_keymap("i", "<C-]>", "<Plug>(copilot-next)", default_opt)

-- Previous
vim.api.nvim_set_keymap("n", "[C", ":cfirst<CR>", default_opt)
vim.api.nvim_set_keymap("n", "[L", ":lfirst<CR>", default_opt)
vim.api.nvim_set_keymap("n", "[c", ":cprevious<CR>", default_opt)
vim.api.nvim_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "[h", ':lua require("gitsigns.actions").prev_hunk()<CR>', default_opt)
vim.api.nvim_set_keymap("n", "[l", ":lprevious<CR>", default_opt)

-- Next
vim.api.nvim_set_keymap("n", "]C", ":clast<CR>", default_opt)
vim.api.nvim_set_keymap("n", "]L", ":llast<CR>", default_opt)
vim.api.nvim_set_keymap("n", "]c", ":cnext<CR>", default_opt)
vim.api.nvim_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "]h", ':lua require("gitsigns.actions").next_hunk()<CR>', default_opt)
vim.api.nvim_set_keymap("n", "]l", ":lnext<CR>", default_opt)

-- Search
vim.api.nvim_set_keymap("n", "<leader>s/", ":Lines<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>sb", ":Buffers<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>sc", ":Commands<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>sf", ":Files<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>sg", ":GitFiles<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>sh", ":History<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>sl", ":Rg<CR>", default_opt)

-- Edit
vim.api.nvim_set_keymap("n", "<leader>ea", ":lua vim.lsp.buf.code_action()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>ef", ":lua vim.lsp.buf.formatting()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>er", ":lua vim.lsp.buf.rename()<CR>", default_opt)
vim.api.nvim_set_keymap("v", "<leader>es", ":'<,'>sort<CR>", default_opt)

-- Goto
vim.api.nvim_set_keymap("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>gf", "gf", default_opt)
vim.api.nvim_set_keymap("n", "<leader>gh", ":lua vim.lsp.buf.hover()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>gs", ":lua vim.lsp.buf.signature_help()<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>gt", ":lua vim.lsp.buf.type_definition()<CR>", default_opt)

-- Toggle
vim.api.nvim_set_keymap("n", "<leader>tl", ":set list!<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>tp", ":set invpaste<CR>", default_opt)
vim.api.nvim_set_keymap("n", "<leader>ts", ":nohlsearch<CR>", default_opt)

-- TODO: DAP keymaps
-- dc  require('dap').continue()
-- dsO require('dap').step_out() "Debug: Step out" },
-- dso require('dap').step_over()
-- dsi require('dap').step_into()
-- bt require('dap').toggle_breakpoint()
-- bc require('dap').clear_breakpoints()
-- dr require('dap').repl.toggle()
