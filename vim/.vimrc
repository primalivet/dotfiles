" imports
" ===========================================================================

source ~/.vim/functions.vim     " include custom functions
source ~/.vim/plugins.vim       " check for vim-plug and install plugins

" plugin settings
" =============================================================================

"let g:ale_echo_msg_format='[%linter% - %severity%] %s'
let g:ale_sign_column_always = 1
let g:ctrlp_show_hidden=1       " show hidden files in ctrlp

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

colorscheme dracula             " set colorscheme
let g:netrw_banner=0            " hide the netrw banner
let g:netrw_liststyle=3         " set netrw filebrowser to list style 3
set cursorline                  " highlight current line
set fillchars=vert:\            " remove vertical split
set lazyredraw                  " only redraw when needed
set number relativenumber       " enable hybrid line numbers
set scrolloff=5                 " when does window start to scroll, in rows
set showmatch matchtime=1       " highlight matching [{()}] ...for a tenth of a second
set splitbelow                  " put new splits beneth the current one
set splitright                  " put new splits right of the current one
set t_ut=                       "  disable bce https://sunaku.github.io/vim-256color-bce.html
syntax on                       " turn syntax highlighting on

" indentation and whitespace
" ==============================================================================

filetype indent on              " enable filetype specific indentation
set autoindent                  " keep the same indentation as the previous line
set expandtab                   " a TAB is acually spaces
set list                        " enable invisible chars
set listchars=trail:·,tab:▸     " define invisible trailing spaces
set shiftround                  " round indent to nearest multiple by 2
set shiftwidth=2                " keep consistent spacing
set smartindent
set softtabstop=2               " a TAB is 2 spaces also when editing
set tabstop=2                   " a TAB is 2 spaces when viewing

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
set showcmd                     " show commands as they are typed

" key mappings
" ==============================================================================

" comma is leader
let mapleader=","

" :W also writes the document, just as :w
command! W w

" :Evimrc to edit ~/.vimrc
command! Evimrc split ~/.vimrc 

" sort inner paragraph
nnoremap <leader>sp :call SortParagraph()<CR>

" Split controls
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" F12 toggles between normal and hybrid line numbers
nnoremap <F12> :call ToggleRelativeNumbers()<CR>
