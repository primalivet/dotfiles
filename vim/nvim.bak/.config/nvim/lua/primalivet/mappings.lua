local M = {}

function M.init()
    local nvim_set_keymap = vim.api.nvim_set_keymap
    local default_opt = {noremap = true, silent = true}

    -- Reloads the entire config, function is defined
    nvim_set_keymap("n", "<leader>vs", ':lua require"primalivet.utils".reload_config()<CR>', default_opt)

    -- make j and k work on wrapped lines
    nvim_set_keymap("n", "j", "gj", default_opt)
    nvim_set_keymap("n", "k", "gk", default_opt)

    nvim_set_keymap("n", "<C-h>", "<C-w>h", default_opt)
    nvim_set_keymap("n", "<C-j>", "<C-w>j", default_opt)
    nvim_set_keymap("n", "<C-k>", "<C-w>k", default_opt)
    nvim_set_keymap("n", "<C-l>", "<C-w>l", default_opt)

    nvim_set_keymap("n", "<C-w>h", "<C-w>H", default_opt)
    nvim_set_keymap("n", "<C-w>j", "<C-w>J", default_opt)
    nvim_set_keymap("n", "<C-w>k", "<C-w>K", default_opt)
    nvim_set_keymap("n", "<C-w>l", "<C-w>L", default_opt)

    -- keep visual selection on >  and < keys
    nvim_set_keymap("v", "<", "<gv", default_opt)
    nvim_set_keymap("v", ">", ">gv", default_opt)

    -- move lines in visual mode
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

    -- Seach (FZF)
    -- nvim_set_keymap("n", "<leader>sc", ":Commands<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sh", ":Helptags<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sf", ":Files<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sg", ":GitFiles<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>s/", ":BLines<CR>", default_opt)
    -- nvim_set_keymap("n", "<leader>sd", ":Dotfiles<CR>", default_opt)

    -- Search (Telescope, defined through commands)
    nvim_set_keymap("n", "<leader>S", ":Telescope builtin<CR>", default_opt)
    nvim_set_keymap("n", "<leader>sc", ":Telescope commands<CR>", default_opt)
    nvim_set_keymap("n", "<leader>sh", ":Telescope help_tags<CR>", default_opt)
    nvim_set_keymap("n", "<leader>sf", ":Telescope find_files<CR>", default_opt)
    nvim_set_keymap("n", "<leader>sg", ":Telescope git_files<CR>", default_opt)
    nvim_set_keymap("n", "<leader>s/", ":Telescope current_buffer_fuzzy_find<CR>", default_opt)
    nvim_set_keymap("n", "<leader>s/", ":Telescope buffers<CR>", default_opt)
    nvim_set_keymap(
        "n",
        "<leader>sd",
        ":Telescope git_files cwd=~/Code/OSS/dotfiles prompt_title=Dotfiles<CR>",
        default_opt
    )

    -- Search (Telescope, defined as Lua strings)
    -- nvim_set_keymap("n", "<leader>ss", ':lua require"telescope.builtin".builtin()<CR>', default_opt)
    -- nvim_set_keymap("n", "<leader>sc", ':lua require"telescope.builtin".commands()<CR>', default_opt)
    -- nvim_set_keymap("n", "<leader>sf", ':lua require"telescope.builtin".find_files()<CR>', default_opt)
    -- nvim_set_keymap("n", "<leader>sg", ':lua require"telescope.builtin".git_files()<CR>', default_opt)
    -- nvim_set_keymap( "n", "<leader>s/", ':lua require"telescope.builtin".current_buffer_fuzzy_find({ previewer = false, sorting_strategy="ascending" })<CR>', default_opt)
    -- nvim_set_keymap("n", "<leader>sb", ':lua require"telescope.builtin".buffers()<CR>', default_opt)
    -- nvim_set_keymap("n", "<leader>sd", ':lua require"primalivet.plugins.telescope".dotfiles()<CR>', default_opt)

    -- Toggle
    nvim_set_keymap("n", "<leader>tt", ":lua require('primalivet.utils').toggle_quickfix()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>tl", ":set list!<CR>", default_opt)
    nvim_set_keymap("n", "<leader>tp", ":set invpaste<CR>", default_opt)
    nvim_set_keymap("n", "<leader>ts", ":nohlsearch<CR>", default_opt)

    nvim_set_keymap("n", "[p", ":lua vim.lsp.diagnostic.goto_prev()<CR>", default_opt)
    nvim_set_keymap("n", "]p", ":lua vim.lsp.diagnostic.goto_next()<CR>", default_opt)
    -- These are here for transparency, as they are already defined by gitsign
    nvim_set_keymap("n", "]c", ':lua require("gitsigns.actions").next_hunk()<CR>', default_opt)
    nvim_set_keymap("n", "[c", ':lua require("gitsigns.actions").prev_hunk()<CR>', default_opt)
end

return M
