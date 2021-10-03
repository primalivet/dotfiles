local M = {}

function M.init()
    vim.cmd "syntax on"
    vim.cmd "filetype plugin on"
    vim.cmd "filetype plugin indent on"

    vim.opt.backup = false -- No backups,
    vim.opt.clipboard = "unnamed"
    vim.opt.cursorline = true -- show what line i'm on
    vim.opt.expandtab = true -- use space indentation
    vim.opt.foldenable = true --  use folds
    vim.opt.foldlevel = 999 -- dont fold at start
    vim.opt.foldmethod = "indent" --by indent
    vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
    vim.opt.grepprg = "rg --vimgrep --no-heading --hidden"
    vim.opt.hidden = true -- dont unload abandoned buffers, just hide em
    vim.opt.ignorecase = true --  dont be case sensitive
    vim.opt.listchars = "tab:>--,space:·,trail:·" -- make em look like this
    vim.opt.number = true -- show numbers
    vim.opt.path = "**"
    vim.opt.relativenumber = true --relative to current row
    vim.opt.scrolloff = 5 -- scroll view when cursor gets close to edge
    vim.opt.shiftround = true
    vim.opt.shiftwidth = 2
    vim.opt.sidescrolloff = 5 -- in both directions
    vim.opt.smartcase = true --  unless i type CAPS
    vim.opt.softtabstop = 2
    vim.opt.splitbelow = true -- and horizontal below
    vim.opt.splitright = true -- vert splits to the right
    vim.opt.tabstop = 2
    vim.opt.termguicolors = true --use more colors than before :)
    vim.opt.textwidth = 80 -- max text width 80,
    vim.opt.timeoutlen = 500 --timeout for mappings and
    vim.opt.updatetime = 100 --updatetime for events
    vim.opt.wildignore = "*/node_modules/*,*/dist/*,*/build/*"
    vim.opt.wrap = false -- but dont wrap
    vim.opt.writebackup = false -- seems to be a problem with some lsps

    vim.g.mapleader = " " -- Space is leader

    require "primalivet.packer".init()
    require "primalivet.netrw".init()
    require "primalivet.statusline".init()
    require "primalivet.mappings".init()

    vim.cmd "command! -nargs=+ Search execute 'silent grep! <args>' | copen" -- rg search and populate quickfix-list
    vim.cmd ":packadd cfilter" -- enable filter quickfix list
    vim.cmd "colorscheme gruvbox" -- set colorscheme
end

return M
