local M = {}

function M.init()
    local nvim_set_keymap = vim.api.nvim_set_keymap
    local default_opt = {noremap = true, silent = true}

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
    nvim_set_keymap("n", "<leader>er", ":lua vim.lsp.buf.rename()<CR>", default_opt)
    nvim_set_keymap("v", "<leader>es", ":'<,'>sort<CR>", default_opt)
    nvim_set_keymap("n", "<leader>ea", ":lua vim.lsp.buf.code_action()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>ef", ":lua vim.lsp.buf.formatting()<CR>", default_opt)

    -- GoTo
    nvim_set_keymap("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>gt", ":lua vim.lsp.buf.type_definition()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>gs", ":lua vim.lsp.buf.signature_help()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>gh", ":lua vim.lsp.buf.hover()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>gf", "gf", default_opt)

    -- Search (Telescope)
    nvim_set_keymap("n", "<leader>sc", ":Telescope commands<CR>", default_opt)
    nvim_set_keymap("n", "<leader>sf", ":Telescope find_files<CR>", default_opt)
    nvim_set_keymap("n", "<leader>sg", ":Telescope git_files<CR>", default_opt)
    nvim_set_keymap("n", "<leader>s/", ":Telescope current_buffer_fuzzy_find<CR>", default_opt)
    nvim_set_keymap("n", "<leader>sb", ":Telescope buffers<CR>", default_opt)

    -- -- Search (FZF)
    -- nvim_set_keymap("n", "<leader>sc", ":Commands<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sf", ":Files<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sg", ":GitFiles<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>s/", ":Lines<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sb", ":Buffers<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sd", ":GitFiles ~/Code/OSS/dotfiles<CR>", default_opt)

    -- Toggle
    nvim_set_keymap("n", "<leader>tl", ":set list!<CR>", default_opt)
    nvim_set_keymap("n", "<leader>tp", ":set invpaste<CR>", default_opt)
    nvim_set_keymap("n", "<leader>ts", ":nohlsearch<CR>", default_opt)

    -- Prev/Next Location list
    nvim_set_keymap("n", "[l", ":lprevious<CR>", default_opt)
    nvim_set_keymap("n", "]l", ":lnext<CR>", default_opt)
    nvim_set_keymap("n", "[L", ":lfirst<CR>", default_opt)
    nvim_set_keymap("n", "]L", ":llast<CR>", default_opt)

    -- Prev/Next Quickfix list
    nvim_set_keymap("n", "[c", ":cprevious<CR>", default_opt)
    nvim_set_keymap("n", "]c", ":cnext<CR>", default_opt)
    nvim_set_keymap("n", "[C", ":cfirst<CR>", default_opt)
    nvim_set_keymap("n", "]C", ":clast<CR>", default_opt)

    -- Prev/Next Hunks
    nvim_set_keymap("n", "]h", ':lua require("gitsigns.actions").next_hunk()<CR>', default_opt)
    nvim_set_keymap("n", "[h", ':lua require("gitsigns.actions").prev_hunk()<CR>', default_opt)

    -- Reloads the entire config, function is defined
    nvim_set_keymap("n", "<leader>vs", ":lua _G.reload_config()<CR>", default_opt)
end

return M
