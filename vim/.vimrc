source ~/.vim/plugins.vim       " include check and eventual install for vim-plug
source ~/.vim/wsl.vim           " include helper to check for WSL

colorscheme PaperColor          " set colorscheme
filetype plugin indent on       " enable filetype detection and specific indentation
let g:ctrlp_show_hidden=1       " show hidden files in ctrlp
let g:netrw_banner=0            " hide the netrw banner
let g:netrw_liststyle=3         " set netrw filebrowser to list style 3
set autoindent                  " keep the same indentation as the previous line
set autoread                    " update files if they're changed outside vim
set background=light            " use light background
set backspace=indent,eol,start  " make backspace behave like normal
set cursorline                  " enable current line highlighting
set encoding=utf-8              " use utf8 encoding
set expandtab                   " a TAB is acually spaces
set fileformat=unix             " use this format
set fileformats=unix,dos,mac    " recognize theses formats
set fillchars=vert:\            " remove vertical split
set hlsearch                    " highlight search matches
set incsearch                   " search as characheters are entered
set laststatus=2                " always show statusline
set lazyredraw                  " only redraw when needed
set matchtime=1                 " ...for a tenth of a second
set nocompatible                " disable vi compatibility
set number                      " enable line numbers
set relativenumber              " enable relative numbers
set scrolloff=10                " when does window start to scroll, in rows
set shiftround                  " round indent to nearest multiple by 2
set shiftwidth=2                " keep consistent spacing
set showcmd                     " show commands in the bottom bar
set showmatch                   " highlight matching [{()}]
set showmode                    " make sure the mode is visible
set smartindent 
set softtabstop=2               " a TAB is 2 spaces also when editing
set splitbelow                  " put new splits beneth the current one
set splitright                  " put new splits right of the current one
set statusline+=Line\ %l        " Line NR
set statusline+=\ in\ %f\       " in relative file
set statusline+=\ of\ %L        " of NR
set statusline=%=               " switch to right side
set tabstop=2                   " a TAB is 2 spaces when viewing
set timeoutlen=1000             " timeout for mappings
set ttimeoutlen=0               " timeout for key codes
set updatetime=250              " interval for when vim writes swap file to disk
set wildignore+=*/.git/*
set wildignore+=*/node_modules/*
set wildmenu                    " enable completion
set wildmode=list:longest       " complete like a shell
syntax on                       " turn syntax highlighting on

if isWSL                        " Windows Subsystem Linux specific settings
  set background=dark
  colorscheme default
endif

" Thanks for the inperation!
" Doug Black        / https://github.com/dougblack
" Nick Nisi         / https://github.com/nicknisi
" Ellen Gummesson   / https://github.com/gummesson
