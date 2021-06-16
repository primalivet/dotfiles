filetype plugin on
filetype plugin indent on

set autoindent
set cindent
set cursorline
set expandtab
set foldcolumn=2
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
set textwidth=80
set timeoutlen=500 "timeout for mapped sequence
set updatetime=100 " updatetime for CursorHold & CursorHoldI

call plug#begin(stdpath('data') . '/plugged')

" Edit
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gregsexton/MatchTag'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Format
" Plug 'dense-analysis/ale' (to slow and dont send diagnostic to nvim_lsp)
" Plug 'sbdchd/neoformat' (cant really understand relation between eslint-plugin-prettier and .prettierc)

" Colors
Plug 'gruvbox-community/gruvbox'
if filereadable('/mnt/c/Code/vim-terminal16/colors/terminal16.vim')
  Plug '/mnt/c/Code/vim-terminal16'
else
  Plug 'primalivet/vim-terminal16'
endif


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

" LSP
" nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>gsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

" Edit
nnoremap <leader>er :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>er	  :Lspsaga rename<CR>
vnoremap <leader>es :'<,'>sort<CR>

" GoTo
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>gs :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>
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

augroup PRIMALIVET
	" Show remove colorcolumn for current window
	" set cc=+1 means set it +1 column from 'textwidth' option
	au! WinLeave * set cc=0 | autocmd! WinEnter * set cc=+1

	" hide statusbar in FZF, whichkey
	au!  FileType fzf,which_key set nonu scl=no ls=0 nosmd noru | autocmd WinLeave <buffer> set nu scl=yes ls=2 smd ru

	" show hunk message
	au! User SignifyHunk call s:show_current_hunk()

	" turn on hlsearch when entering cmd line
	autocmd CmdlineEnter /,\? :set hlsearch

	" wrap lines in markdown
	au BufRead,BufNewFile *.md setlocal wrap

	" hide numbers in txt, markdown
	au! FileType text,md,markdown setlocal nonu nornu
augroup END

" help me!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev W! w!
cnoreabbrev Q! q!
inoreabbrev parmas params
inoreabbrev cosnt const

function! s:show_current_hunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
	echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction

function! s:status_expression()
  let paste = "%{&paste ? '[PASTE]' : ''}"
  let mod = "%{&modified ? '[+]' : !&modifiable ? '[x]' : ''}"
  let ro = "%{&readonly ? '[RO]' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.']' : ''}"
  let branch = "%{exists('g:loaded_fugitive') && FugitiveHead() != '' ? '['.FugitiveHead().']' : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.paste.branch.sep.ft.pos.'%*'.pct
endfunction

let &statusline= s:status_expression()
