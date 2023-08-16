local default_opt = { noremap = true, silent = true }
local gitsigns_ok, gitsigns = pcall(require, "gitsigns")

local lsp_format_async = function()
  vim.lsp.buf.format({ async = true })
end

-- Go over wrapped lines
vim.keymap.set("n", "j", "gj", default_opt)
vim.keymap.set("n", "k", "gk", default_opt)

-- Keep selection in visual mode when indenting
vim.keymap.set("v", "<", "<gv", default_opt)
vim.keymap.set("v", ">", ">gv", default_opt)

-- Move lines in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", default_opt)
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", default_opt)

-- Center on search jump
vim.keymap.set("n", "n", "nzz", default_opt)
vim.keymap.set("n", "N", "Nzz", default_opt)

-- Previous and Next: Quickfix
vim.keymap.set("n", "[c", ":cprevious<CR>", default_opt)
vim.keymap.set("n", "]c", ":cnext<CR>", default_opt)
vim.keymap.set("n", "[C", ":cfirst<CR>", default_opt)
vim.keymap.set("n", "]C", ":clast<CR>", default_opt)

-- Previous and Next: Loclist
vim.keymap.set("n", "[l", ":lprevious<CR>", default_opt)
vim.keymap.set("n", "]l", ":lnext<CR>", default_opt)
vim.keymap.set("n", "[L", ":lfirst<CR>", default_opt)
vim.keymap.set("n", "]L", ":llast<CR>", default_opt)

-- Previous and Next: Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, default_opt)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, default_opt)

-- Diagnostics
vim.keymap.set("n", "<leader>dc", ":Diagnostics<CR>", default_opt)

-- Previous and Next: Buffer
vim.keymap.set("n", "[b", ":bprevious<CR>", default_opt)
vim.keymap.set("n", "]b", ":bnext<CR>", default_opt)

-- Previous and Next: Hunk
if gitsigns_ok then
  vim.keymap.set("n", "[h", gitsigns.prev_hunk, default_opt)
  vim.keymap.set("n", "]h", gitsigns.next_hunk, default_opt)
end

-- Search (FZF)
vim.keymap.set("n", "<leader>sb", ":Buffers<CR>")
vim.keymap.set("n", "<leader>sc", ":Commands<CR>")
vim.keymap.set("n", "<leader>sf", ":Files<CR>")
vim.keymap.set("n", "<leader>sg", ":GitFiles<CR>")

-- Search (Telescope)
-- vim.keymap.set("n", "<leader>sb", ":Telescope buffers<CR>")
-- vim.keymap.set("n", "<leader>sc", ":Telescope commands<CR>")
-- vim.keymap.set("n", "<leader>sf", ":Telescope find_files<CR>")
-- vim.keymap.set("n", "<leader>sg", ":Telescope git_files<CR>")

-- Edit
vim.keymap.set("n", "<leader>ea", vim.lsp.buf.code_action, default_opt)
vim.keymap.set("n", "<leader>ef", lsp_format_async, default_opt)
vim.keymap.set("n", "<leader>er", vim.lsp.buf.rename, default_opt)
vim.keymap.set("v", "<leader>es", ":'<,'>sort<CR>", default_opt)

-- Goto
vim.keymap.set("n", "<leader>gf", "gf", default_opt)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, default_opt)
vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, default_opt)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, default_opt)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, default_opt)
vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, default_opt)
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, default_opt)

-- Toggle
vim.keymap.set("n", "<leader>tl", ":set list!<CR>", default_opt)
vim.keymap.set("n", "<leader>tp", ":set invpaste<CR>", default_opt)
vim.keymap.set("n", "<leader>ts", ":nohlsearch<CR>", default_opt)
vim.keymap.set("n", "<leader>tc", ":ColorizerToggle<CR>", default_opt)
