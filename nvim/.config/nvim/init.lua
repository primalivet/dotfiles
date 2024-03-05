local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd([[colorscheme sixteen]])

vim.cmd(":packadd cfilter") -- enable filter quickfix list

-- TODO: remove options which are equal to default nvim options
opt.autoindent = true
opt.backup = false
opt.clipboard = 'unnamedplus'
opt.cmdheight = 1
opt.cursorline = true
opt.cursorlineopt = "number"
opt.diffopt = "internal,filler,closeoff,vertical"
opt.expandtab = true
opt.fileformats = "unix"
opt.fileignorecase = true
opt.foldenable = false
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.grepformat:append("%f:%l:%c:%m,%f:%l:%m")
opt.grepprg = "rg --vimgrep --no-heading --hidden"
opt.ignorecase = true
opt.listchars:append("space:·") -- chars in :list mode
opt.number = true
-- opt.path:append("**,bin/.local/**,nvim/.config/**,vim/.vim/**,tmux/.**")
opt.relativenumber = true
opt.scrolloff = 5
opt.shiftround = true
opt.shiftwidth = 2
opt.showcmd = false
opt.sidescrolloff = 5
opt.signcolumn = "yes:1"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.swapfile = false
opt.termguicolors = false
opt.timeoutlen = 500 --timeout for mappings
opt.undofile = true  -- uses the default undodir "~/.local/share/nvim/undo
opt.updatetime = 100 --updatetime for events
opt.wildignore:append("*/node_modules/**,*/elm-stuff/**,**/_build/**,**bin**,**/_opam/**")
opt.wildmode = "lastused:list:full"
opt.wrap = false

-- KEYMAPS

local default_opt = { noremap = true, silent = true }

-- Go over wrapped lines
vim.keymap.set("n", "j", "gj", default_opt)
vim.keymap.set("n", "k", "gk", default_opt)

-- Keep selection in visual mode when indenting
vim.keymap.set("v", "<", "<gv", default_opt)
vim.keymap.set("v", ">", ">gv", default_opt)

-- Move lines in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", default_opt)
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", default_opt)

-- Center on search jump
vim.keymap.set("n", "n", "nzz", default_opt)
vim.keymap.set("n", "N", "Nzz", default_opt)

-- Previous and Next: Quickfix
vim.keymap.set("n", "[c", ":cprevious<CR>", default_opt)
vim.keymap.set("n", "]c", ":cnext<CR>", default_opt)
vim.keymap.set("n", "[C", ":cfirst<CR>", default_opt)
vim.keymap.set("n", "]C", ":clast<CR>", default_opt)

-- Previous and Next: Loclist
vim.keymap.set("n", "[l", ":lprevious<CR>", default_opt)
vim.keymap.set("n", "]l", ":lnext<CR>", default_opt)
vim.keymap.set("n", "[L", ":lfirst<CR>", default_opt)
vim.keymap.set("n", "]L", ":llast<CR>", default_opt)

-- Previous and Next: Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, default_opt)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, default_opt)

-- Diagnostics
vim.keymap.set("n", "<leader>dc", ":Diagnostics<CR>", default_opt)

-- Previous and Next: Buffer
vim.keymap.set("n", "[b", ":bprevious<CR>", default_opt)
vim.keymap.set("n", "]b", ":bnext<CR>", default_opt)

-- Search (FZF)
-- vim.keymap.set("n", "<leader>sb", ":Buffers<CR>")
-- vim.keymap.set("n", "<leader>sc", ":Commands<CR>")
-- vim.keymap.set("n", "<leader>sf", ":Files<CR>")
-- vim.keymap.set("n", "<leader>sg", ":GitFiles<CR>")

-- Toggle
vim.keymap.set("n", "<leader>tl", ":set list!<CR>", default_opt)
vim.keymap.set("n", "<leader>tp", ":set invpaste<CR>", default_opt)
vim.keymap.set("n", "<leader>ts", ":nohlsearch<CR>", default_opt)
vim.keymap.set("n", "<leader>tc", ":ColorizerToggle<CR>", default_opt)

-- vim.keymap.set("i", "<C-x><C-a>", require('primalivet.ai').manual_trigger_suggestion, default_opt)

-- TODO: Convert this to lua
vim.cmd [[tnoremap <expr> <esc> &filetype == 'fzf' ? "\<esc>" : "\<c-\>\<c-n>"]]

-- AUTOCOMMANDS

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = vim.api.nvim_create_augroup("PrimalivetHighlightYank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = vim.api.nvim_create_augroup("PrimalivetTerm", { clear = true }),
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
})

-- USERCOMMANDS

vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})

-- PLUGINS

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazygiturl = "https://github.com/folke/lazy.nvim.git"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", lazygiturl, "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
