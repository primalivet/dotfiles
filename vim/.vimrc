source ~/.vim/plugins.vim       " include check and eventual install for vim-plug

" general settings

set autoread                    " update files if they're changed outside vim
set backspace=indent,eol,start  " make backspace behave like normal
set encoding=utf-8              " use utf8 encoding
set fileformat=unix             " use this format
set fileformats=unix,dos,mac    " recognize theses formats
set lazyredraw                  " only redraw when needed
set nocompatible                " disable vi compatibility
set scrolloff=10                " when does window start to scroll, in rows
set timeoutlen=1000             " timeout for mappings
set ttimeoutlen=0               " timeout for key codes
set updatetime=250              " interval for when vim writes swap file to disk

" ctrlp - fuzzy finder

let g:ctrlp_show_hidden=1       " show hidden files in ctrlp

" Vims built in file brower

let g:netrw_banner=0            " hide the netrw banner
let g:netrw_liststyle=3         " set netrw filebrowser to list style 3

" split view

set splitbelow                  " put new splits beneth the current one
set splitright                  " put new splits right of the current one
set fillchars=vert:\            " remove vertical split

" linenumbers

set number                      " enable line numbers
set relativenumber              " enable relative numbers

" highlighting and syntax

syntax on                       " turn syntax highlighting on
set showmatch                   " highlight matching [{()}]
set matchtime=1                 " ...for a tenth of a second
set cursorline                  " enable current line highlighting

" colors

set background=light            " use light background
colorscheme PaperColor          " set colorscheme

set t_ut=                       "  disable bce https://sunaku.github.io/vim-256color-bce.html

" tabs and indentation

filetype indent on              " enable filetype specific indentation
set autoindent                  " keep the same indentation as the previous line
set smartindent 

set expandtab                   " a TAB is acually spaces
set tabstop=2                   " a TAB is 2 spaces when viewing
set softtabstop=2               " a TAB is 2 spaces also when editing

set shiftwidth=2                " keep consistent spacing
set shiftround                  " round indent to nearest multiple by 2

" wild!

set wildignore+=*/.git/*
set wildignore+=*/node_modules/*
set wildmenu                    " enable completion
set wildmode=list:longest       " complete like a shell

" search

set hlsearch                    " highlight search matches
set incsearch                   " search as characheters are entered

set laststatus=2                " always show statusline 

" commandline (below statusline)

set showcmd                     " show commands in the bottom bar
set showmode                    " make sure the mode is visible


" Thanks for the inperation!
" Doug Black        / https://github.com/dougblack
" Nick Nisi         / https://github.com/nicknisi
" Ellen Gummesson   / https://github.com/gummesson
