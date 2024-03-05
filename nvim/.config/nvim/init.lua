local opt = vim.opt
vim.g.mapleader = " "

opt.path:append("**,bin/.local/**,nvim/.config/**,vim/.vim/**,tmux/.**")
opt.wildignore:append("*/node_modules/**,*/elm-stuff/**,**/_build/**,**bin**,**/_opam/**")
opt.wildmode = "lastused:list:full"

opt.clipboard = 'unnamedplus'

opt.grepformat:append("%f:%l:%c:%m,%f:%l:%m")
opt.grepprg = "rg --vimgrep --no-heading --hidden"

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt="number"

opt.undofile = true -- uses the default undodir "~/.local/share/nvim/undo
opt.swapfile = false

-- TODO: Do I need the below?

opt.autoindent = true
opt.backup = false
opt.completeopt = "menu,menuone,noselect" -- needed for cmp nvim
opt.diffopt = "internal,filler,closeoff,vertical"
opt.expandtab = true
opt.fileformats = "unix"
opt.fileignorecase = true
opt.ignorecase = true
opt.listchars:append("space:·") -- chars in :list mode
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
opt.termguicolors = false
opt.timeoutlen = 500 --timeout for mappings
opt.updatetime = 100 --updatetime for events
opt.wrap = false
opt.foldmethod = "expr"
opt.foldenable = false
opt.foldexpr = "nvim_treesitter#foldexpr()"

require("bootstrap-lazy").setup()
require("lazy").setup("plugins")
vim.cmd([[colorscheme sixteen]])
