local M = {}

function M.init()
    vim.cmd "syntax on"
    vim.cmd "filetype plugin on"
    vim.cmd "filetype plugin indent on"

    vim.opt.clipboard = "unnamed"
    vim.opt.cursorline = true -- show what line i'm on
    vim.opt.hidden = true -- dont unload abandoned buffers, just hide em
    vim.opt.number = true -- show numbers
    vim.opt.relativenumber = true --relative to current row
    vim.opt.ignorecase = true --  dont be case sensitive
    vim.opt.smartcase = true --  unless i type CAPS
    vim.opt.termguicolors = true --use more colors than before :)
    vim.opt.textwidth = 80 -- max text width 80,
    vim.opt.wrap = false -- but dont wrap
    vim.opt.backup = false -- No backups,
    vim.opt.writebackup = false -- seems to be a problem with some lsps
    vim.opt.timeoutlen = 500 --timeout for mappings and
    vim.opt.updatetime = 100 --updatetime for events
    vim.opt.scrolloff = 5 -- scroll view when cursor gets close to edge
    vim.opt.sidescrolloff = 5 -- in both directions
    vim.opt.list = true -- show invisibles
    vim.opt.listchars = "tab:>--,space:·,trail:·" -- make em look like this
    vim.opt.foldenable = true --  use folds
    vim.opt.foldmethod = "indent" --by indent
    vim.opt.foldlevel = 999 -- dont fold at start
    vim.opt.expandtab = true -- use space indentation
    vim.opt.tabstop = 2
    vim.opt.shiftround = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.splitright = true -- vert splits to the right
    vim.opt.splitbelow = true -- and horizontal below

    vim.g.mapleader = " "

    require "primalivet.packer".init()
    require "primalivet.netrw".init()
    require "primalivet.statusline".init()
    require "primalivet.mappings".init()

    vim.cmd "colorscheme github_dark_default"
end

return M
