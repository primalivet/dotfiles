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

-- Wildmenu
vim.opt.wildignore = ""
vim.opt.wildmenu = true
vim.opt.wildmode = "list,full" -- on cmd complete, show a list, then complete full

-- Use rg for vimgrep
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m" -- grep in this format (see :h grepformat)
vim.opt.grepprg = "rg --vimgrep --no-heading --hidden" -- with this program

--  Dont be case sensitive unless i type CAPS
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.diffopt = "vertical"
vim.opt.fileformats = "unix"
vim.opt.fillchars = "vert:|"
vim.opt.hidden = true -- dont unload abandoned buffers, just hide em
vim.opt.listchars = "tab:>--,space:·,trail:·,eol:¶" -- make em look like this
vim.opt.path = "**"
vim.opt.showcmd = true -- show what I type
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500 --timeout for mappings and
vim.opt.updatetime = 100 --updatetime for events
vim.opt.wrap = false -- dont wrap
vim.opt.foldenable = false

vim.opt.undofile = true -- uses the default undodir "~/.local/share/nvim/undo

require("primalivet.packer").init()
