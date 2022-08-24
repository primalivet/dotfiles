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
vim.opt.softtabstop = 2

vim.opt.signcolumn = "yes"

-- Wildmenu
vim.opt.path = "**"
vim.opt.wildignore = ""
vim.opt.wildmenu = true
vim.opt.wildmode = "list,full" -- on cmd complete, show a list, then complete full

-- Grep
vim.opt.grepformat:append("%f:%l:%c:%m,%f:%l:%m") -- grep in this format (see :h grepformat)
vim.opt.grepprg = "rg --vimgrep --no-heading --hidden" -- with this program

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Completion
vim.opt.completeopt = "menu,menuone,noselect"

-- Git and Diff
vim.opt.diffopt = "internal,filler,closeoff,vertical"

-- UI
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.fillchars = "vert:|"
vim.opt.showcmd = true
vim.opt.termguicolors = true
vim.opt.wrap = false

-- Undofile
vim.opt.undofile = true -- uses the default undodir "~/.local/share/nvim/undo

-- Timings
vim.opt.timeoutlen = 500 --timeout for mappings and
vim.opt.updatetime = 100 --updatetime for events

-- Misc
vim.opt.fileformats = "unix"
vim.opt.hidden = true -- dont unload abandoned buffers, just hide em
vim.opt.listchars = "tab:>--,space:·,trail:·,eol:¶" -- make em look like this
vim.opt.foldenable = false

require("primalivet.packer").init()
