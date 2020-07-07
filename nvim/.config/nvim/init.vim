"  ____ ____ ____ ____ ____ ____ ____ ____
" ||d |||o |||t |||f |||i |||l |||e |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
"
"
"============================
" PLUGINS
"============================

call plug#begin(stdpath('data') . '/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

"============================
" FUNCTIONS
"============================

function! s:show_documentation()
		if &filetype == 'vim'
				execute 'h '.expand('<cword>')
		else
				call CocAction('doHover')
		endif
endfunction

"============================
" PLUGINS / STATUS AND THEME
"============================

let g:gruvbox_contrast_dark = 'hard'

let g:airline_powerline_fonts = 1

let g:tmuxline_powerline_separators = 1

"============================
" COC
"============================

let g:coc_global_extensions = [
						\ 'coc-tsserver',
						\ 'coc-json',
						\ 'coc-eslint',
						\ 'coc-css',
						\ 'coc-html'
						\ ]

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

colorscheme gruvbox

set hidden
set listchars=tab:>--,space:·,trail:·
set nolist
set number " show line numbers
set noshowmode
set updatetime=300 " updatetime for CursorHold & CursorHoldI
set scrolloff=5
set sidescrolloff=5
set signcolumn=yes " always show error column
set splitbelow
set splitright

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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"============================
" MAPPINGS
"============================

let mapleader=","

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

" MAPPINGS / EDIT
"----------------------------

" move lines https://vim.fandom.com/wiki/Moving_lines_up_or_down
vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv

" keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv

" rename symbol under cursor
nmap <leader>rn <Plug>(coc-rename)

" run eslint autofix
nnoremap <leader>af :CocCommand eslint.executeAutofix<CR>

" Sort selected lines
vmap <leader>ss :'<,'>sort<CR>

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
nnoremap <leader>tl :set list!<CR>

" go to definition
nmap <leader>gd <Plug>(coc-definition)<CR>

" go to references
nmap <leader>gr <Plug>(coc-references)<CR>

" MAPPINGS / SEARCH & EXPLORE
"----------------------------

" fzf search files
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>F :Files<CR>

" fzf/ag project search
nmap <leader>/ <Plug>AgRawSearch
vmap <leader>/ <Plug>AgRawVisualSelection
nmap <leader>* <Plug>AgRawWordUnderCursor

" open netrw file explorer
nnoremap <leader>e :Explore<CR>

" show documentation in preview window
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

" MAPPINGS / OTHER
"----------------------------

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

