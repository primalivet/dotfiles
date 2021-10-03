" I dont want Vim to be compatible with Vi
set nocompatible

syntax enable
filetype plugin on
filetype plugin indent on

set backup=false
set clipboard=unnamed
set expandtab
set foldenable
set foldlevel=999
set foldmethod=indent
set grepformat=%f:%l:%c:%m,%f:%l:%m
set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
set hidden=true
set ignorecase=true
set listchars=tab:>--,space:·,trail:·
set nowrap
set number
set path+=** "
set relativenumber
set scrolloff=5
set shiftround=true
set shiftwidth=2
set sidescrolloff=5
set smartcase=true
set softtabstop=2
set splitbelow=true
set splitright=true
set tabstop=2
set termguicolors
set textwidth=80
set timeoutlen=500
set updatetime=100
set wildignore+=*/node_modules/*,*/dist/*,*/build/*
set writebackup=false

packadd cfilter

colorscheme darkblue

command! -nargs=+ Search execute 'silent grep! <args>' | copen"

let g:mapleader=" "
