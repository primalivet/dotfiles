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

" plugins

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

call plug#end()

" Thank you Doug Black for a good start
" https://dougblack.io/words/a-good-vimrc.html

" general config stuff

set nocompatible		            " disable vi compatibility
set autoread                    " update files if they're changed outside vim
set lazyredraw			            " only redraw when needed
set updatetime=250              " interval for when vim writes swap file to disk
set timeoutlen=1000             " timeout for mappings
set ttimeoutlen=0               " timeout for key codes

" colors

colorscheme default             " set colorscheme
syntax on                       " turn syntax highlighting on
set cursorline			            " enable current line highlighting

" spaces and tabs

set backspace=indent,eol,start  " make backspace behave like normal
set autoindent                  " keep the same indentation as the previous line
set smartindent 
set expandtab				            " a TAB is acually spaces
set tabstop=2				            " a TAB is 2 spaces when viewing
set softtabstop=2 	            " a TAB is 2 spaces also when editing
set shiftwidth=2                " keep consistent spacing

" search

set incsearch                   " search as characheters are entered
set hlsearch                    " highlight search matches

" user interface

set number					            " enable line numbers
set relativenumber	            " enable relative numbers
set laststatus=2                " always show statusline
set showcmd					            " show commands in the bottom bar
set showmatch                   " highlight matching [{()}]
set scrolloff=10                " when does window start to scroll, in rows
set wildmenu                    " enable completion
set wildmode=list:longest       " complete like a shell
