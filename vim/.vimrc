set nocompatible 

if executable('rg')
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
endif


if filereadable('.prettierrc') 
  if filereadable('./node_modules/.bin/prettier') == 1
    augroup MyFormatter
      autocmd!
      " Use Prettier as formatprg and Run Prettier before writing Buffer to
      " disk
      autocmd FileType javascript setlocal formatprg=node_modules/.bin/prettier\ --stdin-filepath\ %
      autocmd BufWritePre *.js silent! normal! ggVGgq
    augroup END
  endif
endif

if filereadable('.eslintrc') 
  let s:has_bin = filereadable('./node_modules/.bin/eslint')
  " TODO: set formatprg?
endif

syntax enable 
filetype plugin indent on
packadd! cfilter
packadd! vim-commentary

set background=dark termguicolors
set hidden noswapfile
set number relativenumber
set autoindent smartindent
set textwidth=79 colorcolumn=+1 nowrap
set formatoptions+=roj
set clipboard=unnamed
set expandtab tabstop=2 softtabstop=2 shiftwidth=2 shiftround
set foldenable foldmethod=indent foldlevel=3
set path+=.,** wildmenu wildignore+=*/node_modules/*,*/dist/*,*/build/*
set nobackup nowritebackup
set splitbelow splitright
set hlsearch incsearch ignorecase smartcase
set scrolloff=5 sidescrolloff=5
set listchars=tab:>--,space:·,trail:·
set timeoutlen=500 updatetime=100

command! -nargs=+ Search execute 'silent grep! <args>' | copen"

" No leader key mappings
" I try to keep this as 'non-destructive' as possible. 
" As and example '<' is mapped below to keep selection after indent and  j is
" mapped to 'go over' wrapped lines

" Use hjkl style navigation in command mode
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

" Location list navigation
nnoremap [l :cprevious
nnoremap ]l :cnext

" Quickfix list navigation
nnoremap [q :cprevious
nnoremap ]q :cnext

" Sort visual selection

" Leader mappings
" Below are leadings (in all modes) but that are prefixed with <leader> key. In
" my case set to <Space>. 

let g:mapleader=" "

" TODO: <leader>er rename under cusor
vnoremap <leader>es :'<,'>sort<CR>
" TODO: <leader>ea display code action
" TODO: <leader>ef format current buffer

" Go to [stuff], these are dependent on the LSP server for respective language.
" Exept <leader>gf which is just an alias for gf (goto file) as I'm used to
" have it prefixed
" TODO: <leader>gd go to definition
" TODO: <leader>gt go to type_definition
" TODO: <leader>gi go to implementation
" TODO: <leader>gr go to references
" TODO: <leader>gs go to signature_help
" TODO: <leader>gh go to hover
nnoremap <leader>gf gf

" Toggle [stuff]
nnoremap <leader>tl :set list!<CR>
nnoremap <leader>tp :set invpaste<CR>
nnoremap <leader>ts :nohlsearch<CR>
