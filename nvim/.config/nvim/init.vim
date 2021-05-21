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

"-------------------------------------------------------------------------------
" COMMANDS
"-------------------------------------------------------------------------------

command! -nargs=0  Format      :call CocAction('format')

command! -nargs=0  OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')

"-------------------------------------------------------------------------------
" AUTOCOMMANDS
"-------------------------------------------------------------------------------

augroup MyWinSettings
	" draws a colorcolumn 1 in +1 column textwidth
	au! WinLeave * set cc=0 | autocmd! WinEnter * set cc=+1

	" hide statusbar in FZF, whichkey
	au!  FileType fzf,which_key set nonu scl=no ls=0 nosmd noru | autocmd WinLeave <buffer> set nu scl=yes ls=2 smd ru
augroup END

augroup MyFileSettings
	" wrap lines in markdown
	au BufRead,BufNewFile *.md setlocal wrap
	" hide numbers in txt, markdown
	au! FileType text,md,markdown set nonu nornu
augroup END

augroup MySearchSettings
	" turn on hlsearch when entering cmd line
	autocmd CmdlineEnter /,\? :set hlsearch
augroup END

"-------------------------------------------------------------------------------
" OPTIONS
"-------------------------------------------------------------------------------

syntax on
filetype plugin on
filetype plugin indent on

" Files and Buffers
set hidden
set nobackup " No backups, seems to be a problem with some lsps
set nowrap
set nowritebackup " No backups, seems to be a problem with some lsps

" UI
set completeopt=menu,menuone,noinsert
set number " show line numbers
set scrolloff=5
set shortmess+=c " Don't pass messages to ins-completion-menu.
set showmode
set sidescrolloff=5
set signcolumn=yes
set splitbelow
set splitright

" Search and Find
set ignorecase
set path+=** " make path act in a recursive fashion on :find etc.
set smartcase

" Fromatting
set listchars=tab:>--,space:·,trail:·
set nolist
set textwidth=80

" Indentation
set autoindent
set cindent
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab

" Timings
set timeoutlen=500 "timeout for mapped sequence
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

"-------------------------------------------------------------------------------
" VIM PLUG / START
"-------------------------------------------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'gerw/vim-HiLinkTrace'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gregsexton/MatchTag'
Plug 'fatih/vim-go'

" load terminal16 locally from my machine if it exists
if filereadable('/data/data/com.termux/files/home/Code/vim-terminal16/colors/terminal16.vim')
  Plug '/data/data/com.termux/files/home/Code/vim-terminal16'
elseif filereadable('/mnt/c/Code/vim-terminal16/colors/terminal16.vim')
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
let g:which_key_map.e.q = 'edit-fix-current'
let g:which_key_map.e.f = 'edit-format-buffer'
let g:which_key_map.e.oi = 'edit-organize-imports'
let g:which_key_map.e.r = 'edit-rename'
let g:which_key_map.e.s = 'edit-sort-selected'
let g:which_key_map.e.hp = 'edit-hunk-preview'
let g:which_key_map.e.hs = 'edit-hunk-stage'
let g:which_key_map.e.hu = 'edit-hunk-undo'
let g:which_key_map.e.d = 'edit-insert-jsdoc'

nmap <leader>eq <Plug>(coc-fix-current)
nmap <leader>ef :Format<CR>
nmap <leader>eoi :OrganizeImports<cr>
nmap <leader>er <Plug>(coc-rename)
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

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
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
let g:which_key_map.t.i = 'toggle-indentlines'

nnoremap <leader>tl :set list!<CR>
nnoremap <leader>tp :set invpaste<CR>
nnoremap <leader>ts :set hlsearch!<CR>
nnoremap <leader>tb :call <SID>toggle_background()<CR>
nnoremap <leader>ti :IndentLinesToggle<CR>


let g:which_key_map.v = { 'name' : '+vimrc' }
let g:which_key_map.v.e = 'vimrc-edit'
let g:which_key_map.v.s = 'vimrc-source'

nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w.e = 'explore'
let g:which_key_map.w.o = 'only-current'
let g:which_key_map.w['='] = 'equal-splits'

nnoremap <leader>wo :only<CR>
nnoremap <leader>we :Explore<CR>
nnoremap <leader>w= <C-w>=

let g:which_key_map['['] = { 'name' : '+previous' }
let g:which_key_map['['].q = 'previous-qucikfix'

nmap <leader>[q <Plug>(coc-diagnostic-prev)
nmap <leader>[h <Plug>(GitGutterPrevHunk)

let g:which_key_map[']'] = { 'name' : '+next' }
let g:which_key_map[']'].q = 'next-quickfix'

nmap <leader>]q <Plug>(coc-diagnostic-next)
nmap <leader>]h <Plug>(GitGutterNextHunk)

"-------------------------------------------------------------------------------
" COC
"-------------------------------------------------------------------------------

let g:coc_global_extensions = [
			\'coc-vimlsp',
			\'coc-yaml',
			\'coc-json',
			\'coc-html',
			\'coc-css',
			\'coc-eslint',
			\'coc-tsserver',
			\'coc-phpls',
			\'coc-diagnostic',
			\'coc-sh'
			\]

" show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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
" IndentLines
"-------------------------------------------------------------------------------

let g:indentLine_fileTypeExclude = ['fzf']
let g:indentLine_enabled = 0

"-------------------------------------------------------------------------------
" Syntax and Hightlight
"-------------------------------------------------------------------------------

let g:vim_markdown_frontmatter = 1

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

set background=dark
colorscheme terminal16
" set termguicolors " not with theme terminal16
