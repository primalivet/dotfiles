local M = {}

function M.init()
    local nvim_set_keymap = vim.api.nvim_set_keymap
    local default_opt = {noremap = true, silent = true}

    -- make j and k work on wrapped lines
    nvim_set_keymap("n", "j", "gj", default_opt)
    nvim_set_keymap("n", "k", "gk", default_opt)

    -- remap split controls to not use prefix
    nvim_set_keymap("n", "<C-h>", "<C-w>h", default_opt)
    nvim_set_keymap("n", "<C-j>", "<C-w>j", default_opt)
    nvim_set_keymap("n", "<C-k>", "<C-w>k", default_opt)
    nvim_set_keymap("n", "<C-l>", "<C-w>l", default_opt)

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

    -- Search
    nvim_set_keymap("n", "<leader>sf", ':lua require"telescope.builtin".find_files()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>sg", ':lua require"telescope.builtin".git_files()<CR>', default_opt)
    nvim_set_keymap(
        "n",
        "<leader>sc",
        ':lua require"telescope.builtin".current_buffer_fuzzy_find({ previewer = false, sorting_strategy="ascending" })<CR>',
        default_opt
    )
    nvim_set_keymap("n", "<leader>sb", ':lua require"telescope.builtin".buffers()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>s*", ':lua require"telescope.builtin".grep_string()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>s/", ':lua require"telescope.builtin".live_grep()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>sd", ':lua require"primalivet.plugins.telescope".dotfiles()<CR>', default_opt)

    -- Toggle
    -- nvim_set_keymap("n", "<leader>tt", ":TroubleToggle<CR>", default_opt)
    nvim_set_keymap("n", "<leader>tt", ":lua require('primalivet.utils').toggle_quickfix()<CR>", default_opt)
    nvim_set_keymap("n", "<leader>tl", ":set list!<CR>", default_opt)
    nvim_set_keymap("n", "<leader>tp", ":set invpaste<CR>", default_opt)
    nvim_set_keymap("n", "<leader>ts", ":nohlsearch<CR>", default_opt)
    nvim_set_keymap(
        "n",
        "<leader>tb",
        ':lua require"primalivet.plugins.github-theme".toggle_background()<CR>',
        default_opt
    )

    -- Vimrc
    nvim_set_keymap("n", "<leader>ve", ":edit $MYVIMRC<CR>", default_opt)
    -- nvim_set_keymap('n', '<leader>vs', ':source $MYVIMRC<CR>', default_opt)
    -- TODO: https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11

    -- Previous and Next of problems, git hunks etc
    nvim_set_keymap("n", "[q", ":lua vim.lsp.diagnostic.goto_prev()<CR>", default_opt)
    nvim_set_keymap("n", "]q", ":lua vim.lsp.diagnostic.goto_next()<CR>", default_opt)
    nvim_set_keymap("n", "]c", ':lua require("gitsigns.actions").next_hunk()<CR>', default_opt)
    nvim_set_keymap("n", "[c", ':lua require("gitsigns.actions").prev_hunk()<CR>', default_opt)
end

return M
