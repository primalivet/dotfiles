vim.g.mapleader = " " -- Space is leader

-- Linenumbers
vim.opt.number = true -- show numbers
vim.opt.relativenumber = true --relative to current row

-- Indents
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Spaces and tabs
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2

-- Scrolloff (scroll when close to the edge)
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- Folds
vim.opt.foldenable = true
vim.opt.foldlevel = 100
vim.opt.foldmethod = "indent"

-- Wildmenu
vim.opt.wildignore = ""
vim.opt.wildmenu = true
vim.opt.wildmode = "list,full" -- on cmd complete, show a list, then complete full

vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m" -- grep in this format (see :h grepformat)
vim.opt.grepprg = "rg --vimgrep --no-heading --hidden" -- with this program

vim.opt.ignorecase = true --  dont be case sensitive
vim.opt.smartcase = true --  unless i type CAPS

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.diffopt = "vertical"
vim.opt.fileformats = "unix"
vim.opt.fillchars = "vert:|"
vim.opt.hidden = true -- dont unload abandoned buffers, just hide em
vim.opt.listchars = "tab:>--,space:·,trail:·,eol:¶" -- make em look like this
vim.opt.mouse = "nv" -- Mouse support in normal and visual mode
vim.opt.path = "**"
vim.opt.showcmd = true -- show what I type
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500 --timeout for mappings and
vim.opt.updatetime = 100 --updatetime for events
vim.opt.wrap = false -- dont wrap

require("primalivet.packer").init()
