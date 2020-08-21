"  ____ ____ ____ ____ ____ ____ ____ ____
" ||d |||o |||t |||f |||i |||l |||e |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
"
"
"============================
" PLUGINS / PRE LOADING
"============================

let g:ale_completion_enable = 1

"============================
" PLUGINS
"============================

call plug#begin(stdpath('data') . '/plugged')
Plug '/mnt/c/Code/vim-terminal16'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

"============================
" FUNCTIONS
"============================

function! RootDir()
	let l:cwd_string = fnamemodify(getcwd(), ':t')
	return cwd_string
endfunction


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    :ALEHover
  endif
endfunction

"============================
" PLUGINS / STATUS AND THEME
"============================

let g:gruvbox_contrast_dark = 'hard'

let g:airline_powerline_fonts = 1

let g:tmuxline_powerline_separators = 1

"============================
" FZF
"============================

let g:fzf_layout = { 'down': '50%' }

"============================
" ALE
"============================

let g:ale_sign_column_always = 1

let g:ale_linters_explicit = 1

let g:ale_list_window_size = 5

let g:ale_set_quickfix = 1

let g:ale_open_list = 1

let g:ale_linters = {
\ 'css': ['stylelint'],
\ 'scss': ['stylelint'],
\ 'javascript': ['eslint', 'tsserver'],
\ 'php': ['phpcs'],
\ 'vim': ['vimls'],
\}

let g:ale_fixers = {
\ 'css': ['stylelint'],
\ 'scss': ['stylelint'],
\ 'javascript': ['eslint'],
\ 'php': ['phpcbf'],
\}

"============================
" MUCOMPLETE
"============================

let g:mucomplete#enable_auto_at_startup = 1

"============================
" NETRW
"============================

let g:netrw_banner = 0 " hide annoying banner
let g:netrw_browse_splits = 4 " open files in same window
let g:netrw_liststyle = 3 " tree style listing
let g:netrw_list_hide= netrw_gitignore#Hide() " hide same files as gitignore

"============================
" GENERIC
"============================

colorscheme terminal16


set background=dark
set completeopt=menu,menuone,noinsert
set cursorline
set hidden
set listchars=tab:>--,space:·,trail:·
set nolist
set number " show line numbers
set omnifunc=ale#completion#OmniFunc
set scrolloff=5
set showmode
set sidescrolloff=5
set signcolumn=yes " always show error column
set splitbelow
set splitright
set updatetime=300 " updatetime for CursorHold & CursorHoldI

"----------------------------
" GENERIC / STATUSLINE
"----------------------------

set statusline=
" root dir
set statusline=%{RootDir()}
" space
set statusline+=\ 
" short filename, truncate left  
set statusline+=%<%f
" space
set statusline+=\ 
" show if helpfile
set statusline+=%h
" show if file modified
set statusline+=%m
" show if file read only
set statusline+=%r
" fugitive statusline for git
set statusline+=%{FugitiveStatusline()}
" switch to right side of statusline
set statusline+=%=
" align left, bigger max width, %l line, %c column, %V virtual column
set statusline+=%-14.(%l,%c%V%)
" space
set statusline+=\ 
" percentage of file
set statusline+=%P

"============================
" ABBREVIATIONS
"============================

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev W! w!
cnoreabbrev Q! q!

"============================
" AUTOCOMMANDS
"============================

" hide statusbar in FZF window
autocmd!  FileType fzf set laststatus=0 noshowmode noruler | autocmd WinLeave <buffer> set laststatus=2 showmode ruler

"============================
" MAPPINGS
"============================

let mapleader=","

"----------------------------
" MAPPINGS / MOVEMENT
"----------------------------

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

"----------------------------
" MAPPINGS / EDIT
"----------------------------

" move lines https://vim.fandom.com/wiki/Moving_lines_up_or_down
vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv

" keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv

" rename symbol under cursor
nnoremap <leader>rn :ALERename<CR>

" run eslint autofix
nnoremap <leader>af :ALEFix<CR>

" Sort selected lines
vmap <leader>ss :'<,'>sort<CR>

"----------------------------
" MAPPINGS / UI AND SETTINGS
"----------------------------

" increase the default width/height of window resize. this is still the
" default window resizing keymaps, se :h window-resize
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>

" :only
nnoremap <leader>o :only<CR>

" unhighlight seach results
nnoremap <leader><Space> :nohlsearch<CR>

" toggle paste mode
nnoremap <leader>tp :set invpaste<CR>

" toggle list (hidden chars)
nnoremap <leader>thc :set list!<CR>

" open/close qucikfix list
nnoremap <leader>cw :cw<CR>
nnoremap <leader>cc :cc<CR>

" go to definition
nnoremap <leader>gd :ALEGoToDefinition<CR>

" find references
nnoremap <leader>gr :ALEFindReferences<CR>

"----------------------------
" MAPPINGS / SEARCH & VIEW
"----------------------------

" only this buffer
nnoremap <leader>o :only<CR>

" fzf search files
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>F :Files<CR>

" fzf/ag project search
nmap <leader>/ <Plug>AgRawSearch
vmap <leader>/ <Plug>AgRawVisualSelection<CR>
vmap <leader>* <Plug>AgRawWordUnderCursor<CR>

" open netrw file explorer
nnoremap <leader>e :Explore<CR>

" show documentation in preview window
 nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

"----------------------------
" MAPPINGS / OTHER
"----------------------------

" edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
