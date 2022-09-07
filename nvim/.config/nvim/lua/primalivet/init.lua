vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.signcolumn = "yes:1"
vim.opt.path = "**"
vim.opt.wildignore = "*/node_modules/**,*/elm-stuff/**"
vim.opt.wildmenu = true
vim.opt.wildmode = "lastused:list:full"
vim.opt.fileignorecase = true
vim.opt.grepformat:append("%f:%l:%c:%m,%f:%l:%m")
vim.opt.grepprg = "rg --vimgrep --no-heading --hidden"
vim.opt.fileignorecase = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.diffopt = "internal,filler,closeoff,vertical"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.fillchars = "vert:|"
vim.opt.laststatus = 1
vim.opt.showcmd = true
vim.opt.termguicolors = false
vim.opt.wrap = false
vim.opt.undofile = true -- uses the default undodir "~/.local/share/nvim/undo
vim.opt.timeoutlen = 500 --timeout for mappings and
vim.opt.updatetime = 100 --updatetime for events
vim.opt.fileformats = "unix"
vim.opt.hidden = true -- dont unload abandoned buffers, just hide em
vim.opt.listchars = "tab:>--,space:·,trail:·,eol:¶" -- chars to use in :list mode
vim.cmd'colorscheme sixteen'
require("primalivet.packer").init()
