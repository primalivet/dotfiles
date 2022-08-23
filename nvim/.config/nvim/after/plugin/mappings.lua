local default_opt = { noremap = true, silent = true }

-- Go over wrapped lines
vim.keymap.set("n", "j", "gj", default_opt)
vim.keymap.set("n", "k", "gk", default_opt)

-- Keep selection in visual mode when indenting
vim.keymap.set("v", "<", "<gv", default_opt)
vim.keymap.set("v", ">", ">gv", default_opt)

-- Move lines in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", default_opt)
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", default_opt)

-- Previous
vim.keymap.set("n", "[C", ":cfirst<CR>", default_opt)
vim.keymap.set("n", "[L", ":lfirst<CR>", default_opt)
vim.keymap.set("n", "[c", ":cprevious<CR>", default_opt)
vim.keymap.set("n", "[l", ":lprevious<CR>", default_opt)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, default_opt)
vim.keymap.set("n", "[h", function()
  require("gitsigns.actions").prev_hunk()
end, default_opt)

-- Next
vim.keymap.set("n", "]C", ":clast<CR>", default_opt)
vim.keymap.set("n", "]L", ":llast<CR>", default_opt)
vim.keymap.set("n", "]c", ":cnext<CR>", default_opt)
vim.keymap.set("n", "]l", ":lnext<CR>", default_opt)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, default_opt)
vim.keymap.set("n", "]h", function()
  require("gitsigns.actions").next_hunk()
end, default_opt)

-- Search
vim.keymap.set("n", "<leader>s/",function() require('fzf-lua').lines() end, default_opt)
vim.keymap.set("n", "<leader>sb", function() require('fzf-lua').buffers() end, default_opt)
vim.keymap.set("n", "<leader>sc", function() require('fzf-lua').commands() end, default_opt)
vim.keymap.set("n", "<leader>sf", function() require('fzf-lua').files() end, default_opt)
vim.keymap.set("n", "<leader>sg", function() require('fzf-lua').git_files() end, default_opt)
vim.keymap.set("n", "<leader>sh", function() require('fzf-lua').command_history() end, default_opt)
vim.keymap.set("n", "<leader>sl", function() require('fzf-lua').grep() end, default_opt)

-- Edit
vim.keymap.set("n", "<leader>ea", vim.lsp.buf.code_action, default_opt)
vim.keymap.set("n", "<leader>ef", vim.lsp.buf.formatting, default_opt)
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

-- TODO: DAP keymaps
-- dc  require('dap').continue()
-- dsO require('dap').step_out() "Debug: Step out" },
-- dso require('dap').step_over()
-- dsi require('dap').step_into()
-- bt require('dap').toggle_breakpoint()
-- bc require('dap').clear_breakpoints()
-- dr require('dap').repl.toggle()
