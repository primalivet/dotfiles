local opt = vim.opt
vim.g.mapleader = " "

opt.autoindent = true
opt.cursorline = true
opt.cursorlineopt="number"
opt.backup = false
opt.completeopt = "menu,menuone,noselect" -- needed for cmp nvim
opt.diffopt = "internal,filler,closeoff,vertical"
opt.expandtab = true
opt.fileformats = "unix"
opt.fileignorecase = true
opt.grepformat:append("%f:%l:%c:%m,%f:%l:%m")
opt.grepprg = "rg --vimgrep --no-heading --hidden"
opt.hidden = true -- dont unload abandoned buffers, just hide em
opt.ignorecase = true
opt.laststatus = 2
opt.listchars:append("space:·") -- chars in :list mode
opt.number = true
opt.path:append("**,bin/.local/**,nvim/.config/**,vim/.vim/**,tmux/.**")
opt.relativenumber = true
opt.scrolloff = 5
opt.shiftround = true
opt.shiftwidth = 2
opt.showcmd = false
opt.cmdheight = 1
opt.sidescrolloff = 5
opt.signcolumn = "yes:1"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.swapfile = false
opt.termguicolors = false
opt.timeoutlen = 500 --timeout for mappings
opt.undofile = true -- uses the default undodir "~/.local/share/nvim/undo
opt.updatetime = 100 --updatetime for events
opt.wildignore = "*/node_modules/**,*/elm-stuff/**,**/_build/**,**bin**,**/_opam/**"
opt.wildmenu = true
opt.wildmode = "lastused:list:full"
opt.wrap = false
opt.foldmethod = "expr"
opt.foldenable = false
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.hlsearch = true

require("bootstrap-lazy").setup()
require("lazy").setup("plugins")
vim.cmd([[colorscheme sixteen]])
