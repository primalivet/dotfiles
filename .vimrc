"  Thank you Doug Black for a good start
" https://dougblack.io/words/a-good-vimrc.html

set nocompatible		      " disable vi compatibility

" color

colorscheme pablo      " set colorscheme
syntax enable				      " enable syntax highlighting

" spaces and tabs

set softtabstop=2 	      " a TAB is 2 spaces also when editing
set tabstop=2				      " a TAB is 2 spaces when viewing
set shiftwidth=2          " keep consistent spacing
set expandtab				      " a TAB is acually spaces
set autoindent            " keep the same indentation as the previous line

" ui

set number					      " enable line numbers
set relativenumber	      " enable relative numbers
set showcmd					      " show commands in the bottom bar
set cursorline			      " enable current line highlighting
set lazyredraw			      " only redraw when needed
set wildmenu
set showmatch             " highlight matching [{()}]
set splitright            " default split to the right 
set splitbelow            " default split nested down
set laststatus=2          " always show statusline
set scrolloff=10          " set limit in number of rows when the editor should start scrolling
set updatetime=250        " interval for when vim writes swap file to disk
set timeoutlen=1000       " timeout for mappings
set ttimeoutlen=0         " timeout for key codes

" search

set incsearch             " search as characheters are entered
set hlsearch              " highlight search matches

" dispable arrow keys
" for breaking habits: http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" plugins - requires vim version >= 8

let g:ale_linters={'javascript':['eslint']}

packloadall               " load all plugins now
silent! helptags ALL      " load all helptags now, all messages and error will be ignored
