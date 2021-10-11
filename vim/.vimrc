set nocompatible

set autoindent smartindent
set background=dark
set backspace=eol,indent,start
set clipboard=unnamed
set expandtab tabstop=4 shiftwidth=4 shiftround
set foldenable foldmethod=indent foldlevel=3
set hidden noswapfile nobackup nowritebackup
set hlsearch incsearch ignorecase smartcase
set laststatus=1
set listchars=tab:>--,space:·,trail:·
set number relativenumber
set path+=.,** 
set scrolloff=5 sidescrolloff=5
set showcmd ruler
set textwidth=79 colorcolumn=+1 nowrap formatoptions+=roj
set timeoutlen=500 updatetime=100
set wildmenu wildignore+=*/node_modules/*,*/dist/*,*/build/*

" If rg is available on the system, use it for the :grep command instead of the
" normal grep program
if executable('rg')
        set grepformat=%f:%l:%c:%m,%f:%l:%m
        set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
endif

" Enable build in packages/plugins
" cfilter enables :Cfilter quickfix/loc list
" matchit improves the % operator
packadd! cfilter 
packadd! matchit

filetype plugin indent on
syntax enable

let g:mapleader="\<Space>"

" Use hjkl style navigation in ex-command mode
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Go over wrapped lines with j and k
nnoremap j gj
nnoremap k gk

" Keep selection when indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" Move lines in visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <leader>ts :nohlsearch<CR>

" Location list navigation
nnoremap [l :cprevious<CR>
nnoremap ]l :cnext<CR>

" Quickfix list navigation
nnoremap [c :cprevious<CR>
nnoremap ]c :cnext<CR>

" Sort visual selection
vnoremap <leader>es :'<,'>sort<CR>

" Run grep through the whole project, populate quickfix list with result and
" then open quickfix list.
command! -nargs=+ Grep execute 'silent grep! <args>' | copen"


