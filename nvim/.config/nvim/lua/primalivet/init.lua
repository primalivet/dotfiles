local M = {}
local g = vim.g
local opt = vim.opt

function M.init()
        -- vim.cmd "filetype plugin on"
        -- vim.cmd "filetype plugin indent on"
        -- vim.opt.fillchars = "vert:|"
        -- vim.opt.backup = false -- No backups,
        -- vim.opt.clipboard = "unnamed"
        -- vim.opt.cursorline = false -- show what line i'm on
        -- vim.opt.diffopt = "vertical"
        -- vim.opt.expandtab = true -- use space indentation
        opt.foldenable = true --  use folds
        opt.foldlevel = 3 -- dont fold at start
        opt.foldmethod = "indent" --by indent
        -- vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
        -- vim.opt.grepprg = "rg --vimgrep --no-heading --hidden"
        -- vim.opt.ignorecase = true --  dont be case sensitive
        -- vim.opt.listchars = "tab:>--,space:·,trail:·" -- make em look like this
        -- vim.opt.relativenumber = true --relative to current row
        -- vim.opt.scrolloff = 5 -- scroll view when cursor gets close to edge
        -- vim.opt.shiftround = true
        -- vim.opt.shiftwidth = 2
        -- vim.opt.sidescrolloff = 5 -- in both directions
        -- vim.opt.smartcase = true --  unless i type CAPS
        -- vim.opt.softtabstop = 2
        -- vim.opt.splitbelow = true -- and horizontal below
        -- vim.opt.splitright = true -- vert splits to the right
        -- vim.opt.tabstop = 2
        -- vim.opt.termguicolors = false --use more colors than before :)
        -- vim.opt.textwidth = 80 -- max text width 80,
        -- vim.opt.wildignore = "*/node_modules/*,*/dist/*,*/build/*"
        -- vim.opt.writebackup = false -- seems to be a problem with some lsps
        -- vim.cmd ":packadd cfilter" -- enable filter quickfix list

        g.mapleader = " " -- Space is leader
        opt.hidden = true -- dont unload abandoned buffers, just hide em
        opt.number = true -- show numbers
        opt.path = "**"
        opt.timeoutlen = 500 --timeout for mappings and
        opt.updatetime = 100 --updatetime for events
        opt.wrap = false -- but dont wrap

        _G.reload_config = function()
                require("plenary.reload").reload_module("primalivet")
                require("primalivet").init()
                print("Reloaded config")
        end

        require'primalivet.packer'.init()
        require'primalivet.mappings'.init()
end

return M
