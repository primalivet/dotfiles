" vim: fdm=marker

" plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug '/mnt/c/code/vim-realrealplain' " use local version
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
call plug#end()
" }}}

" plugin settings {{{
let g:lightline={'colorscheme': 'realrealplain'}

let g:netrw_banner=0                " hide annoying banner
let g:netrw_browse_splits=4         " open files in same window, :Sex and :Vex for splits
let g:netrw_liststyle=3             " tree style listing

let g:ale_linters = { 
    \ 'javascript': ['eslint'],
    \ 'php': ['phpcs'] 
    \ }
let g:ale_fixers = { 
    \ 'javascript': ['prettier'],
    \ 'php': ['php_cs_fixer'] 
    \ }
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 2
" }}}

" base settings (see :h nvim-defaults) {{{
" set colorscheme
colorscheme realrealplain
" use comma ',' as leader key
let mapleader="," 		    
" prefer dark background
set background=dark
set formatoptions+=ro
" hightlight matching brackets for 1/10 of a second
set matchtime=1                     
" don't backup before overwriting a file
set nobackup                        
" show the current mode
set noshowmode                      
" dont use a swap file
set noswapfile                      
" dont wrap lines
set nowrap                          
" if the :write wasn't successfull, everything is fucked
set nowritebackup                   
" linenumbers
set number                          
" make the path smart when using :find etc. etc.
set path+=**                        
" start to scroll when cursor is < 5 rows from end of buffer
set scrolloff=5                     
" round indent to multiples of shiftwidth
set shiftround                      
" highlight matching brackets
set showmatch                       
" open new horizontal splits to the botton
set splitbelow                      
" open new vertical splits to the right
set splitright                      
" ignore node_modules
set wildignore+=**/node_modules/**

" }}}

" commands {{{
" capital w writes
command! W w 			    
" capital q quits
command! Q q
" }}}

" cross mode mappings {{{
" increase the default width/height of window resize. this is still the
" default window resizing keymaps, se :h window-resize
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>
" }}}

" normal mode mappings {{{
" disable ex mode
nnoremap Q <Nop>

" make j and k work on wrapped lines
nnoremap j gj
nnoremap k gk

" center stuff when focused
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" split controls
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open netrw quickly!
nnoremap <leader>e :Explore<CR>

" unhighlight seach results
nnoremap <leader><Space> :nohlsearch<CR>
"}}}

" insert mode mappings {{{
" insert parens and braces automatically and place cursor inside.
inoremap ({<CR> ({<CR>})<C-o>O
inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap [<CR> [<CR>]<C-o>O
" }}}

" visual mode mappings {{{
" also keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv
" }}}

" auto commands {{{
" treat json as javascript
autocmd BufNewFile,BufRead *.json set ft=javascript
" }}}
