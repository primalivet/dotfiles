"  ____ ____ ____
" ||v |||i |||m ||
" ||__|||__|||__||
" |/__\|/__\|/__\|
"
" use space as leader
let mapleader="\<Space>"

"-------------------------------------------------------------------------------
" MAPPINGS / NO LEADER
"-------------------------------------------------------------------------------

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

augroup MyWinSettings
	" draws a colorcolumn 1 in +1 column textwidth
	au! WinLeave * set cc=0 | autocmd! WinEnter * set cc=+1

	" hide statusbar in FZF, whichkey
	au!  FileType fzf,which_key set ls=0 | autocmd WinLeave <buffer> set ls=2
augroup END

augroup MyFileSettings
	" hide numbers in txt, markdown
	au! FileType text,md set nonu nornu
augroup END

augroup MySearchSettings
	" turn on hlsearch when entering cmd line
	autocmd CmdlineEnter /,\? :set hlsearch
augroup END

set backupcopy=yes
set completeopt=menu,menuone,noinsert
set cursorline
set hidden
set ignorecase
set listchars=tab:>--,space:·,trail:·
set nolist
set showmode
set nowrap
set number " show line numbers
set relativenumber " show relative line numbers
set omnifunc=ale#completion#OmniFunc
set path+=** " make path act in a recursive fashion on :find etc.
set scrolloff=5
set sidescrolloff=5
set signcolumn=yes " always show error column
set smartcase
set splitbelow
set splitright
set textwidth=80
set timeoutlen=500
set updatetime=300 " updatetime for CursorHold & CursorHoldI

"-------------------------------------------------------------------------------
" NETEW
"-------------------------------------------------------------------------------

let g:netrw_banner = 0 " hide annoying banner
let g:netrw_browse_splits = 4 " open files in same window
let g:netrw_liststyle = 3 " tree style listing
let g:netrw_list_hide= netrw_gitignore#Hide() " hide same files as gitignore

"-------------------------------------------------------------------------------
" VIM PLUG / PRE START
"-------------------------------------------------------------------------------

" need to happen before ale loads
let g:ale_completion_enable = 1

"-------------------------------------------------------------------------------
" VIM PLUG / START
"-------------------------------------------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'liuchengxu/vim-which-key'
Plug 'dense-analysis/ale'
Plug 'lifepillar/vim-mucomplete'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx','typescript'], 'do': 'make install' }
Plug 'gerw/vim-HiLinkTrace'
Plug 'Yggdroot/indentLine'
Plug 'gruvbox-community/gruvbox'

" load terminal16 locally from my machine if it exists
if filereadable('/mnt/c/Code/vim-terminal16/colors/terminal16.vim')
	Plug '/mnt/c/Code/vim-terminal16'
else
	Plug 'primalivet/vim-terminal16'
endif

"-------------------------------------------------------------------------------
" VIM PLUG / END
"-------------------------------------------------------------------------------

call plug#end()

"-------------------------------------------------------------------------------
" WHICH KEY
"-------------------------------------------------------------------------------

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_use_floating_win = 0
let g:which_key_hspace = 15

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {} " reset keymap

let g:which_key_map.e = { 'name' : '+edit' }
let g:which_key_map.e.f = 'edit-fix-buffer'
let g:which_key_map.e.r = 'edit-rename'
let g:which_key_map.e.s = 'edit-sort-selected'
let g:which_key_map.e.hp = 'edit-hunk-preview'
let g:which_key_map.e.hs = 'edit-hunk-stage'
let g:which_key_map.e.hu = 'edit-hunk-undo'
let g:which_key_map.e.d = 'edit-insert-jsdoc'

nmap <leader>ef <Plug>(ale_fix)
nmap <leader>er <Plug>(ale_rename)
vnoremap <leader>es :'<,'>sort<CR>
nmap <leader>ehp <Plug>(GitGutterPreviewHunk)
nmap <leader>ehs <Plug>(GitGutterStageHunk)
nmap <leader>ehu <Plug>(GitGutterUndoHunk)
nmap <silent> <leader>ed <Plug>(jsdoc)

let g:which_key_map.g = { 'name' : '+goto' }
let g:which_key_map.g.d = 'goto-definition'
let g:which_key_map.g.r = 'goto-references'
let g:which_key_map.g.h = 'goto-documentation'
let g:which_key_map.g.f = 'goto-file'

nmap <leader>gd <Plug>(ale_go_to_definition)
nmap <leader>gr <Plug>(ale_find_references)
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>
nnoremap <leader>gf gf

let g:which_key_map.s = { 'name' : '+search' }
let g:which_key_map.s.f = 'search-files'
let g:which_key_map.s.b = 'search-buffers'
let g:which_key_map.s.g = 'search-git-files'
let g:which_key_map.s['*'] = 'ag-raw-under-cursor'
let g:which_key_map.s['/'] = 'ag-raw-search' " uses range in visual

nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :GFiles<CR>
nnoremap <leader>sb :Buffers<CR>
nmap <leader>s* <Plug>AgRawWordUnderCursor<CR>
nmap <leader>s/ <Plug>AgRawSearch
vmap <leader>s/ <Plug>AgRawVisualSelection<CR>

let g:which_key_map.t = { 'name' : '+toggle' }
let g:which_key_map.t.l = 'toggle-list-chars'
let g:which_key_map.t.p = 'toggle-paste-mode'
let g:which_key_map.t.s = 'toggle-search-highlight'
let g:which_key_map.t.b = 'toggle-background'

nnoremap <leader>tl :set list!<CR>
nnoremap <leader>tp :set invpaste<CR>
nnoremap <leader>ts :set hlsearch!<CR>
nnoremap <leader>tb :call <SID>toggle_background()<CR>


let g:which_key_map.v = { 'name' : '+vimrc' }
let g:which_key_map.v.e = 'vimrc-edit'
let g:which_key_map.v.s = 'vimrc-source'

nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w.e = 'explore'
let g:which_key_map.w.o = 'only-current'

nnoremap <leader>wo :only<CR>
nnoremap <leader>we :Explore<CR>

let g:which_key_map['['] = { 'name' : '+previous' }
let g:which_key_map['['].q = 'previous-qucikfix'

nmap <leader>[q <Plug>(ale_previous_wrap)

let g:which_key_map[']'] = { 'name' : '+next' }
let g:which_key_map[']'].q = 'next-quickfix'

nmap <leader>]q <Plug>(ale_next_wrap)

"-------------------------------------------------------------------------------
" ALE
"-------------------------------------------------------------------------------

call ale#linter#Define('php', {
			\   'name': 'intelephense',
			\   'lsp': 'stdio',
			\   'executable': 'intelephense',
			\   'command': '%e --stdio',
			\   'project_root': function('ale_linters#php#langserver#GetProjectRoot')
			\ })

function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		:ALEHover
	endif
endfunction

let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_list_window_size = 10
let g:ale_set_quickfix = 1
" opens quickfix list automatically
" let g:ale_open_list = 1
" how long should ale wait until sending request to lsp server
let g:ale_completion_delay = 100
let g:ale_completion_autoimport = 1


let g:ale_linters = {
			\ 'css': ['stylelint'],
			\ 'scss': ['stylelint'],
			\ 'javascript': ['eslint', 'tsserver'],
			\ 'typescript': ['tsserver'],
			\ 'php': ['intelephense', 'phpcs' ],
			\ 'vim': ['vimls'],
			\ 'c': [ 'gcc', 'clangd'],
			\ 'haskell': ['ghc']
			\}

let g:ale_fixers = {
			\ 'css': ['stylelint'],
			\ 'scss': ['stylelint'],
			\ 'javascript': ['eslint'],
			\ 'php': ['phpcbf'],
			\ 'c': ['clang-format']
			\}

"-------------------------------------------------------------------------------
" MUCOMPLETE
"-------------------------------------------------------------------------------

function! CompetionMethod()
	return get(g:mucomplete#msg#short_methods,
				\ get(g:, 'mucomplete_current_method', ''), '')
endfunction

let g:mucomplete#enable_auto_at_startup = 1

"-------------------------------------------------------------------------------
" GITGUTTER
"-------------------------------------------------------------------------------

" remove mapping to preview hunk, they're remapped below
let g:gitgutter_map_keys = 0

"-------------------------------------------------------------------------------
" FZF
"-------------------------------------------------------------------------------

let g:fzf_layout = { 'down': '50%' }

"-------------------------------------------------------------------------------
" GRUVBOX
"-------------------------------------------------------------------------------

let g:gruvbox_sign_column = 'bg0'

"-------------------------------------------------------------------------------
" TERMINAL16
"-------------------------------------------------------------------------------

" let g:terminal16_256_colors = 1

"-------------------------------------------------------------------------------
" STATUSLINE
"-------------------------------------------------------------------------------

function! RootDir()
	let l:cwd_string = fnamemodify(getcwd(), ':t')
	return cwd_string
endfunction

function! PasteMode()
	if &paste
		return "[PASTE]"
	else
		return ""
	endif
endfunction

" set colors / set statusline+=%#HighlightGroup#
" start empty
set statusline=
" root dir
set statusline+=%{RootDir()}
" fugitive statusline for git
set statusline+=\ %{FugitiveHead()}
" space, short filename, truncate left
set statusline+=\ %<%f
" space, show if helpfile
set statusline+=\ %h
" show if file modified
set statusline+=%m
" show if file read only
set statusline+=%r
" paste mode is on?
set statusline+=%{PasteMode()}
" switch to right side of statusline
set statusline+=%=
" filetype
set statusline+=%y
" align left, bigger max width, %l line, %c column, %V virtual column
set statusline+=\ %-14.(%l,%c%V%)
" percentage of file
set statusline+=%P

"-------------------------------------------------------------------------------
" ABBREVIATIONS
"-------------------------------------------------------------------------------

" help went I type it sloppy
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev W! w!
cnoreabbrev Q! q!

"-------------------------------------------------------------------------------
" COLORS
"-------------------------------------------------------------------------------

function! s:toggle_background()
	if &background == 'dark'
		set background=light
	else
		set background=dark
	endif
endfunction

set background=light
colorscheme terminal16
let g:terminal16_256_colors = 1
" set termguicolors " enable 24 bit colors
