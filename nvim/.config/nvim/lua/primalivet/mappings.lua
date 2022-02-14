local M = {}

function M.init()
    local wk = require "which-key"
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
    wk.register {

        ["<leader>"] = {
            e = {
                name = "+edit",
                a = {":lua vim.lsp.buf.code_action()<CR>", "code-action-at-cursor"},
                f = {":lua vim.lsp.buf.formatting()<CR>", "format-buffer"},
                r = {":lua vim.lsp.buf.rename()<CR>", "rename-under-cursor"},
                s = {":'<,'>sort<CR>", "sort-visual-selection", mode = "v"}
            },
            g = {
                name = "+goto",
                -- TODO: show on cursor hold nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", default_opt)
                d = {":lua vim.lsp.buf.definition()<CR>", "goto-definition"},
                f = {"gf", "goto-file"},
                h = {":lua vim.lsp.buf.hover()<CR>", "goto-hover-info"},
                i = {":lua vim.lsp.buf.implementation()<CR>", "goto-implmentation"},
                r = {":lua vim.lsp.buf.references()<CR>", "goto-reference"},
                s = {":lua vim.lsp.buf.signature_help()<CR>", "goto-signature-help"},
                t = {":lua vim.lsp.buf.type_definition()<CR>", "goto-type-definition"}
            },
            s = {
                name = "+search",
                ["/"] = {":Lines<CR>", "search-lines"},
                b = {":Buffers<CR>", "search-buffers"},
                c = {":Commands<CR>", "search-commands"},
                f = {":Files<CR>", "search-files"},
                g = {":GitFiles<CR>", "search-git-files"},
                h = {":History<CR>", "search-history"},
                l = {":Rg<CR>", "search-ripgrep"}
            },
            t = {
                name = "+toggle",
                l = {":set list!<CR>", "toggle-list-chars"},
                p = {":set invpaste<CR>", "toggle-paste-mode"},
                s = {":nohlsearch<CR>", "toggle-search-highlight"}
            },
            ["["] = {
                name = "+previous",
                ["[C"] = {":cfirst<CR>", "first-quickfix-list"},
                ["[L"] = {":lfirst<CR>", "first-location-list"},
                ["[c"] = {":cprevious<CR>", "prev-quickfix-list"},
                ["[h"] = {':lua require("gitsigns.actions").prev_hunk()<CR>', "prev-git-hunk"},
                ["[l"] = {":lprevious<CR>", "prev-location-list"}
            },
            ["]"] = {
                name = "+next",
                ["]C"] = {":clast<CR>", "last-quickfix-list"},
                ["]L"] = {":llast<CR>", "last-location-list"},
                ["]c"] = {":cnext<CR>", "next-quickfix-list"},
                ["]h"] = {':lua require("gitsigns.actions").next_hunk()<CR>', "next-git-hunk"},
                ["]l"] = {":lnext<CR>", "next-location-list"}
            },
            c = {
                name = "+config",
                c = {":PackerCompile", "config-compile"},
                r = {":lua _G.reload_config()<CR>", "config-reload"},
                s = {":PackerSync<CR>", "config-sync"}
            }
        }
    }
end

return M
