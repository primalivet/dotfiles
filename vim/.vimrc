" .vimrc
" ============================================================================
"  Theeeesee (david attenborough) vimfiles uses native packages. So you wont
"  find a list of plugins here. If you're curiouse have a look in:
"  ./vim/.vim/pack/plugins/[start|opt]/[name] to see what plugins are used. The
"  ones in 'start' are loaded automatically and the ones in opt need to be
"  loaded with the :packadd ex command.
" ============================================================================

" call fzf install script if not already installed
if executable('fzf') == 0
        " TODO: maybe check if fzf submodule is loaded
        execute '!~/.vim/pack/plugins/start/fzf/install' 
endif

set nocompatible 

syntax enable 
filetype plugin indent on
packadd! cfilter

set backspace=eol,indent,start
set clipboard=unnamed
set expandtab autoindent smartindent
set foldenable foldmethod=indent foldlevel=3
set hidden noswapfile nobackup nowritebackup
set hlsearch incsearch ignorecase smartcase
set listchars=tab:>--,space:·,trail:·
set number relativenumber
set path+=.,** wildmenu wildignore+=*/node_modules/*,*/dist/*,*/build/*
set scrolloff=5 sidescrolloff=5
set termguicolors background=dark
set textwidth=79 colorcolumn=+1 nowrap formatoptions+=roj
set timeoutlen=500 updatetime=100
set modeline modelines=5

if executable('rg')
        set grepformat=%f:%l:%c:%m,%f:%l:%m
        set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
endif

let g:fzf_layout = { 'down': '50%' }

" Mappings (no leader key)
" =============================================================================
" I try to keep this as 'non-destructive' as possible. 
" As and example '<' is mapped below to keep selection after indent and  j is
" mapped to 'go over' wrapped lines
" =============================================================================

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
nnoremap [l :cprevious<CR>
nnoremap ]l :cnext<CR>

" Quickfix list navigation
nnoremap [c :cprevious<CR>
nnoremap ]c :cnext<CR>

" Mappings (with leader key)
" =============================================================================
" Below are leadings (in all modes) but that are prefixed with <leader> key. In
" my case set to <Space>. 
" =============================================================================

let g:mapleader="\<Space>"

" TODO: <leader>er rename under cusor
" Sort visual selection
vnoremap <leader>es :'<,'>sort<CR>
" TODO: <leader>ea display code action
" TODO: <leader>ef format current buffer

" Seach (FZF)
nnoremap <silent><leader>sc :Commands<CR>
nnoremap <silent><leader>sh :Helptags<CR>
nnoremap <silent><leader>sf :Files<CR>
nnoremap <silent><leader>sg :GitFiles<CR>
nnoremap <silent><leader>s/ :BLines<CR>

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

if executable('rg')
        set grepformat=%f:%l:%c:%m,%f:%l:%m
        set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
endif

" Run grep through the whole project, populate quickfix list with result and
" then open quickfix list.
command! -nargs=+ Grep execute 'silent grep! <args>' | copen"

