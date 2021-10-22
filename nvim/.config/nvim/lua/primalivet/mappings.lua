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

    -- Search (Telescope, defined as Lua strings)
    nvim_set_keymap("n", "<leader>ss", ':lua require"telescope.builtin".builtin()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>sc", ':lua require"telescope.builtin".commands()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>sf", ':lua require"telescope.builtin".find_files()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>sg", ':lua require"telescope.builtin".git_files()<CR>', default_opt)
    nvim_set_keymap( "n", "<leader>s/", ':lua require"telescope.builtin".current_buffer_fuzzy_find({ previewer = false, sorting_strategy="ascending" })<CR>', default_opt)
    nvim_set_keymap("n", "<leader>sb", ':lua require"telescope.builtin".buffers()<CR>', default_opt)
    nvim_set_keymap("n", "<leader>sd", ':lua require"telescope.builtin".git_files({ cwd = "~/Code/OSS/dotfiles", prompt_title = "Dotfiles" })<CR>', default_opt)

    -- Toggle
    nvim_set_keymap("n", "<leader>tl", ":set list!<CR>", default_opt)
    nvim_set_keymap("n", "<leader>tp", ":set invpaste<CR>", default_opt)
    nvim_set_keymap("n", "<leader>ts", ":nohlsearch<CR>", default_opt)

    -- Prev/Next Location list
    nvim_set_keymap("n", "[l", ":lprevious", default_opt)
    nvim_set_keymap("n", "]l", ":lnext", default_opt)
    nvim_set_keymap("n", "[L", ":lfirst", default_opt)
    nvim_set_keymap("n", "]L", ":llast", default_opt)

    -- Prev/Next Quickfix list
    nvim_set_keymap("n", "[c", ":cprevious<CR>", default_opt)
    nvim_set_keymap("n", "]c", ":cnext<CR>", default_opt)
    nvim_set_keymap("n", "[C", ":cfirst<CR>", default_opt)
    nvim_set_keymap("n", "]C", ":clast<CR>", default_opt)

    -- Prev/Next Hunks
    nvim_set_keymap("n", "]h", ':lua require("gitsigns.actions").next_hunk()<CR>', default_opt)
    nvim_set_keymap("n", "[h", ':lua require("gitsigns.actions").prev_hunk()<CR>', default_opt)

    -- Reloads the entire config, function is defined
    nvim_set_keymap("n", "<leader>vs", ':lua _G.reload_config()<CR>', default_opt)
end

return M
