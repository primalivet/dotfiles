"  ____ ____ ____
" ||v |||i |||m ||
" ||__|||__|||__||
" |/__\|/__\|/__\|
"
"============================
" FUNCTIONS
"============================

function! GccCompileRunDestroy()
	let l:filename_no_extention = expand('%:r')
	execute '!gcc % -o ' . filename_no_extention . '.out && ./' . filename_no_extention . '.out && rm ' . filename_no_extention . '.out'
endfunction

function! RootDir()
	let l:cwd_string = fnamemodify(getcwd(), ':t')
	return cwd_string
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

"============================
" PLUGINS
"============================

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'jesseleite/vim-agriculture'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-which-key'

" only load HiLinkTrace when working in dotfiles or colorscheme dir
if (fnamemodify(getcwd(), ':t') ==? 'dotfiles') || (fnamemodify(getcwd(), ':t') ==? 'vim-terminal16')
	Plug 'gerw/vim-HiLinkTrace'
endif

if filereadable('/mnt/c/Code/vim-terminal16/colors/terminal16.vim')
	" source terminal16 from locally from my machine if it exists
	Plug '/mnt/c/Code/vim-terminal16'
else
	Plug 'primalivet/vim-terminal16'
endif

call plug#end()

"============================
" PLUGINS / POST LOADED
"============================

let g:netrw_banner = 0 " hide annoying banner
let g:netrw_browse_splits = 4 " open files in same window
let g:netrw_liststyle = 3 " tree style listing
let g:netrw_list_hide= netrw_gitignore#Hide() " hide same files as gitignore

let g:coc_global_extensions = [
 \ 'coc-json',
 \ 'coc-tsserver',
 \ 'coc-eslint',
 \ 'coc-highlight',
 \ 'coc-vimlsp',
 \ 'coc-pairs',
 \ 'coc-phpls',
 \ 'coc-diagnostic',
 \ 'coc-css',
 \ 'coc-stylelint'
 \ ]

let g:fzf_layout = { 'down': '50%' }

" remove mapping to preview hunk (gitgutter)
" Hunks are remapped below
let g:gitgutter_map_keys = 0

let g:terminal16_256_colors = 1

"============================
" GENERIC
"============================

colorscheme terminal16

set background=dark
set backupcopy=yes
set cmdheight=1
set completeopt=menu,menuone,noinsert
set cursorline
set encoding=utf-8
set hidden
set ignorecase
set listchars=tab:>--,space:·,trail:·
set nobackup
set nolist
set nowrap
set nowritebackup
set number " show line numbers
set scrolloff=5
set shortmess+=c " dont pass messages to in-completion-menu
set sidescrolloff=5
set signcolumn=yes " always show error column
set smartcase
set splitbelow
set splitright
set timeoutlen=500
set updatetime=300 " updatetime for CursorHold & CursorHoldI

"----------------------------
" GENERIC / STATUSLINE
"----------------------------

set statusline=
" root dir
set statusline+=%{RootDir()}
" space, short filename, truncate left
set statusline+=\ %<%f
" space, show if helpfile
set statusline+=\ %h
" show if file modified
set statusline+=%m
" show if file read only
set statusline+=%r
" fugitive statusline for git
set statusline+=%{FugitiveHead()}
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
" COMMANDS
"============================

"============================
" AUTOCOMMANDS
"============================

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" support for comments in jsonc format
autocmd FileType json syntax match Comment +\/\/.\+$+

" hide statusbar in FZF, Which Key and Quickfix
autocmd!  FileType fzf,which_key set laststatus=0 noshowmode noruler | autocmd WinLeave <buffer> set laststatus=2 showmode ruler

" hide numbers in txt files
autocmd! FileType txt set nonumber

"============================
" MAPPINGS
"============================

let mapleader="\<Space>"

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>

let g:which_key_use_floating_win = 0
let g:which_key_map = {}
let g:which_key_hspace = 15

"----------------------------
" MAPPINGS / NO LEADER
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

" increase the default width/height of window resize. this is still the
" default window resizing keymaps, se :h window-resize
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>

" move lines https://vim.fandom.com/wiki/Moving_lines_up_or_down
vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv

" keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv

"----------------------------
" MAPPINGS / NEXT & PREVIOUS
"----------------------------

let g:which_key_map['['] = { 'name' : '+previous' }
let g:which_key_map[']'] = { 'name' : '+next' }

let g:which_key_map['['].q = 'previous-diagnostic'

let g:which_key_map[']'].q = 'next-diagnostic'

nmap <leader>[q <Plug>(coc-diagnostic-next)
nmap <leader>]q <Plug(coc-diagnostic-prev)

"----------------------------
" MAPPINGS / WINDOW
"----------------------------

let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w.o = 'only-current'
let g:which_key_map.w.e = 'explore'

" :only
nnoremap <leader>wo :only<CR>

" open netrw file explorer
nnoremap <leader>we :Explore<CR>

"----------------------------
" MAPPINGS / TOGGLE
"----------------------------

let g:which_key_map.t = { 'name' : '+toggle' }
let g:which_key_map.t.l = 'toggle-list-chars'
let g:which_key_map.t.s = 'toggle-search-highlight'
let g:which_key_map.t.p = 'toggle-paste-mode'

" toggle paste mode
nnoremap <leader>tp :set invpaste<CR>

" toggle list (hidden chars)
nnoremap <leader>tl :set list!<CR>

" toggle search highlight
nnoremap <leader>ts :set hlsearch!<CR>

"----------------------------
" MAPPINGS / GOTO
"----------------------------

let g:which_key_map.g = { 'name' : '+goto' }
let g:which_key_map.g.d = 'goto-definition'
let g:which_key_map.g.r = 'goto-references'
let g:which_key_map.g.h = 'goto-documentation'

" go to definition
nmap <leader>gd <Plug>(coc-definition)

" find references
nmap <leader>gr <Plug>(coc-references)

" show documentation in preview window
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>

"----------------------------
" MAPPINGS / VIMRC
"----------------------------

let g:which_key_map.v = { 'name' : '+vimrc' }
let g:which_key_map.v.e = 'vimrc-edit'
let g:which_key_map.v.s = 'vimrc-source'

" edit vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>

" source vimrc
nnoremap <leader>vs :source $MYVIMRC<CR>

"----------------------------
" MAPPINGS / EDIT
"----------------------------

let g:which_key_map.e = { 'name' : '+edit' }
let g:which_key_map.e.f = 'edit-fix-buffer'
let g:which_key_map.e.a = 'edit-codeaction'
let g:which_key_map.e.r = 'edit-rename'
let g:which_key_map.e.s = 'edit-sort-selected'
let g:which_key_map.e.hp = 'edit-hunk-preview'
let g:which_key_map.e.hs = 'edit-hunk-stage'
let g:which_key_map.e.hu = 'edit-hunk-undo'

" run autofix
nmap <leader>ea <Plug>(coc-codeaction)

" run autofix
nmap <leader>ef <Plug>(coc-fix-current)

" rename symbol under cursor
nmap <leader>er <Plug>(coc-rename)

" Sort selected lines
vnoremap <leader>es :'<,'>sort<CR>

" edit git hunk
nmap <leader>ehp <Plug>(GitGutterPreviewHunk)
nmap <leader>ehs <Plug>(GitGutterStageHunk)
nmap <leader>ehu <Plug>(GitGutterUndoHunk)

"----------------------------
" MAPPINGS / SEARCH
"----------------------------

let g:which_key_map.s = { 'name' : '+search' }
let g:which_key_map.s.f = 'search-files'
let g:which_key_map.s.g = 'search-git-files'
let g:which_key_map.s.b = 'search-buffers'
let g:which_key_map.s['/'] = 'ag-raw-search' " uses range in visual
let g:which_key_map.s['*'] = 'ag-raw-under-cursor'

" fzf search files
nnoremap <leader>sf :Files<CR>

" fzf search git files
nnoremap <leader>sg :GFiles<CR>

" fzf search git files
nnoremap <leader>sb :Buffers<CR>

" fzf/ag project search
nmap <leader>s/ <Plug>AgRawSearch
vmap <leader>s/ <Plug>AgRawVisualSelection<CR>

"fzf/ag
nmap <leader>s* <Plug>AgRawWordUnderCursor<CR>
