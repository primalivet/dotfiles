syntax on
filetype plugin on
filetype plugin indent on

" TODO: reset 'sets' from nvim defaults
set autoindent
set background=dark
set cindent
set cursorline
set expandtab
set foldenable
set foldlevel=999 " never start folded
set foldmethod=indent
set hidden " Files and Buffers
set ignorecase
set listchars=tab:>--,space:·,trail:·
set nobackup " No backups, seems to be a problem with some lsps
set nolist
set nowrap
set nowritebackup " No backups, seems to be a problem with some lsps
set number
set path+=** " make path act in a recursive fashion on :find etc.
set scrolloff=5
set shiftround
set shiftwidth=2
set shortmess+=c " Don't pass messages to ins-completion-menu.
set sidescrolloff=5
set signcolumn=yes
set smartcase " only be case sensitive when i type CAPS
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors " not with theme terminal16
set textwidth=80
set timeoutlen=500 "timeout for mapped sequence
set updatetime=100 " updatetime for CursorHold & CursorHoldI

let g:netrw_banner = 0 " hide annoying banner
let g:netrw_browse_splits = 4 " open files in same window
let g:netrw_liststyle = 3 " tree style listing
let g:netrw_list_hide= netrw_gitignore#Hide() " hide same files as gitignore
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'bg0'


" TODO move to separate file
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" TODO move to separate file
call plug#begin(stdpath('data') . '/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gregsexton/MatchTag'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'gruvbox-community/gruvbox'
call plug#end()

let mapleader=" "

" auto esc on move
imap jj <Esc>j
imap kk <Esc>k

" make j and k work on wrapped lines
nnoremap j gj
nnoremap k gk

" remap split controls to not use prefix
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" center stuff when focused
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" increase the default width/height of window resize. this is still the
" default window resizing keymaps, se :h window-resize
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize +5<CR>
noremap <C-w>> :vertical:resize -5<CR>

" move lines https://vim.fandom.com/wiki/Moving_lines_up_or_down
vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv

" keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv

" Edit
nnoremap <leader>er :lua vim.lsp.buf.rename()<CR>
vnoremap <leader>es :'<,'>sort<CR>
nnoremap <leader>ea :lua vim.lsp.buf.code_action()<CR>

" GoTo
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>gs :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gf gf

" Search
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :GFiles<CR>
nnoremap <leader>sb :Buffers<CR>
nmap <leader>s* <Plug>AgRawWordUnderCursor
nmap <leader>s/ <Plug>AgRawSearch
vmap <leader>s/ <Plug>AgRawVisualSelection

" Toggle
nnoremap <leader>tl :set list!<CR>
nnoremap <leader>tp :set invpaste<CR>
nnoremap <leader>ts :set hlsearch!<CR>

" Vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" Window
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>wx :sp<CR>
nnoremap <leader>w= <C-w>=
nnoremap <leader>wo :only<CR>
nnoremap <leader>we :Explore<CR>

nnoremap [q :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]q :lua vim.lsp.diagnostic.goto_next()<CR>
" [C goes to first git hunk
" [c goes to prev git hunk
" ]c goes to next git hunk
" ]C goes to last git hunk

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev W! w!
cnoreabbrev Q! q!
inoreabbrev parmas params
inoreabbrev cosnt const

" source lua files
lua require 'primalivet.lsp'
lua require 'primalivet.compe'

colorscheme gruvbox
