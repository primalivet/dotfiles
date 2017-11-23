" check if vim-plug is installed

if !filereadable('~/.vim/autoload/plug.vim')
  if executable('curl')
    call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    if v:shell_error
      echom "Error installing vim-plug to ~/.vim/autoload, Please try installing it manually.\n"
      exit
    endif
  else
    echom "vim-plug not installed. Please install it manually or install curl.\n"
    exit
  endif
endif

" register plugins

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'

call plug#end()

" configure plugins

let g:ctrlp_show_hidden=1

" general config stuff

set nocompatible		            " disable vi compatibility
set encoding=utf-8
set autoread                    " update files if they're changed outside vim
set lazyredraw			            " only redraw when needed
set updatetime=250              " interval for when vim writes swap file to disk
set timeoutlen=1000             " timeout for mappings
set ttimeoutlen=0               " timeout for key codes
set fileformats=unix,dos,mac    " recognize theses formats
set fileformat=unix             " use this format

" colors

set t_Co=256
set background=light
colorscheme PaperColor          " set colorscheme
syntax on                       " turn syntax highlighting on
set cursorline			            " enable current line highlighting

" spaces and tabs

filetype plugin indent on       " enable filetype detection and specific indentation
set backspace=indent,eol,start  " make backspace behave like normal
set autoindent                  " keep the same indentation as the previous line
set smartindent 
set expandtab				            " a TAB is acually spaces
set tabstop=2				            " a TAB is 2 spaces when viewing
set softtabstop=2 	            " a TAB is 2 spaces also when editing
set shiftwidth=2                " keep consistent spacing
set shiftround                  " round indent to nearest multiple by 2

" search

set incsearch                   " search as characheters are entered
set hlsearch                    " highlight search matches

" user interface

let g:netrw_liststyle=3         " set netrw filebrowser to list style 3
let g:netrw_banner=0            " hide the netrw banner
set number					            " enable line numbers
set relativenumber	            " enable relative numbers
set laststatus=2                " always show statusline
set showmode                    " make sure the mode is visible
set showcmd					            " show commands in the bottom bar
set showmatch                   " highlight matching [{()}]
set matchtime=1                 " ...for a tenth of a second
set scrolloff=10                " when does window start to scroll, in rows
set splitbelow                  " put new splits beneth the current one
set splitright                  " put new splits right of the current one
set fillchars=vert:\            " remove vertical split "|"
set wildmenu                    " enable completion
set wildmode=list:longest       " complete like a shell
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*

" statusline

set statusline=%=               " switch to right side
set statusline+=Line\ %l        " Line NR
set statusline+=\ of\ %L        " of NR
set statusline+=\ in\ %f\       " in relative file

" Thanks for the inperation!
" Doug Black        / https://github.com/dougblack
" Nick Nisi         / https://github.com/nicknisi
" Ellen Gummesson   / https://github.com/gummesson
