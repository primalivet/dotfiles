source ~/.vim/functions.vim
source ~/.vim/plugins.vim

colorscheme realrealplain
filetype plugin indent on
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_splits=4
let g:netrw_liststyle=3
let mapleader=","
set autoindent smartindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set encoding=utf-8
set expandtab tabstop=2 softtabstop=2
set fileformat=unix fileformats=unix,dos,mac
set fillchars=vert:\
set hlsearch incsearch
set lazyredraw
set list listchars=trail:·,tab:▸\ 
set nocompatible
set number relativenumber
set path+=**
set scrolloff=4
set shiftwidth=2 shiftround
set showcmd laststatus=2
set showmatch matchtime=1
set splitbelow splitright
set t_ut=
set timeoutlen=1000 ttimeoutlen=0
set updatetime=250
set wildmenu wildignore=*/.git/*,*/node_modules/*
syntax on

command! W w
command! Q q
command! Evimrc split ~/.vimrc

nnoremap q: <Nop>
nnoremap Q <Nop>

" sort inner paragraph
nnoremap <leader>sp :call SortParagraph()<CR>

" split controls
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" F12 toggles between normal and hybrid line numbers
nnoremap <F12> :call ToggleRelativeNumbers()<CR>
