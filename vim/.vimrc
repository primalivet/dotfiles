" imports
" ===========================================================================

source ~/.vim/functions.vim     " include custom functions
source ~/.vim/plugins.vim       " check for vim-plug and install plugins

" plugin settings
" =============================================================================

let g:ctrlp_show_hidden=1       " show hidden files in ctrlp

let g:lightline={ 'colorscheme': 'Dracula' }

let g:ale_sign_column_always = 1
let g:ale_echo_msg_format='[%linter%] %s [%severity%]'

" misc
"==============================================================================

set autoread                    " update files if they're changed outside vim
set backspace=indent,eol,start  " make backspace behave like normal
set encoding=utf-8              " use utf8 encoding
set fileformat=unix             " use this format
set fileformats=unix,dos,mac    " recognize theses formats
set timeoutlen=1000             " timeout for mappings
set ttimeoutlen=0               " timeout for key codes
set updatetime=250              " interval for when vim writes swap file to disk

" ui, color and highlighting
" ==============================================================================

syntax on                       " turn syntax highlighting on
colorscheme dracula             " set colorscheme
set cursorline                  " highlight current line

set showmatch matchtime=1       " highlight matching [{()}] ...for a tenth of a second
set number relativenumber       " enable hybrid line numbers
set scrolloff=5                 " when does window start to scroll, in rows

set t_ut=                       "  disable bce https://sunaku.github.io/vim-256color-bce.html

set splitbelow                  " put new splits beneth the current one
set splitright                  " put new splits right of the current one
set fillchars=vert:\            " remove vertical split

let g:netrw_banner=0            " hide the netrw banner
let g:netrw_liststyle=3         " set netrw filebrowser to list style 3

set lazyredraw                  " only redraw when needed

" indentation and whitespace
" ==============================================================================

filetype indent on              " enable filetype specific indentation
set autoindent                  " keep the same indentation as the previous line
set smartindent
set expandtab                   " a TAB is acually spaces
set shiftround                  " round indent to nearest multiple by 2
set shiftwidth=2                " keep consistent spacing
set tabstop=2                   " a TAB is 2 spaces when viewing
set softtabstop=2               " a TAB is 2 spaces also when editing

set list                        " enable invisible chars
set listchars+=trail:·          " define invisible trailing spaces
set listchars=tab:▸\            " define invisible tabs

" search and wild
" ==============================================================================

set hlsearch                    " highlight search matches
set incsearch                   " search as characheters are entered

set wildignore+=*/.git/*
set wildignore+=*/node_modules/*
set wildmenu                    " enable completion
set wildmode=list:longest       " complete like a shell

" statusline
"===============================================================================

set laststatus=2                " always show statusline
set noshowmode                  " hide default 'mode' in statusline
set showcmd                     " show commands as they are typed

" key mappings
" ==============================================================================

" comma is leader
let mapleader=","

" :W also writes the document, just as :w
command! W w

" F12 toggles between normal and hybrid line numbers
nnoremap <F12> :call ToggleRelativeNumbers()<CR>
