" vim: fdm=marker

" plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug '/mnt/c/code/vim-realrealplain' " use local version
Plug 'gerw/vim-HiLinkTrace'
Plug 'cocopon/colorswatch.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
call plug#end()
" }}}

" plugin settings {{{

" hide annoying banner
let g:netrw_banner = 0              
" open files in same window, :Sex and :Vex for splits
let g:netrw_browse_splits = 4       
" tree style listing
let g:netrw_liststyle = 3           
" hide same files as are ignored by git
let g:netrw_list_hide= netrw_gitignore#Hide()

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ctrlp_show_hidden = 1

let g:deoplete#enable_at_startup = 1
" }}}

" base settings (see :h nvim-defaults) {{{
" set colorscheme
colorscheme realrealplain
" use comma ',' as leader key
let mapleader="," 		    
" prefer dark background
set background=dark
" set colorcolumn to 1 charater more than textwidth, so all lines should be
" wrapped before the colorcolumn, if wrap is set
set colorcolumn=+1
" highlight current cursor line
set cursorline
" set formatoptions, se :h fo-table for help on each option
set formatoptions=tcroj
" show statusline when nessasary
set laststatus=2
" hightlight matching brackets for 1/10 of a second
set matchtime=1                     
" don't backup before overwriting a file
set nobackup                        
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
" start to scroll when cursor is < 16 columns from end of line
set sidescrolloff=15
" round indent to multiples of shiftwidth
set shiftround                      
" highlight matching brackets
set showmatch                       
" open new horizontal splits to the botton
set splitbelow                      
" open new vertical splits to the right
set splitright                      
" limit text width to 80 characters
set textwidth=80
" 
set timeoutlen=0
" ignore .git directory
set wildignore+=**/.git/**
" ignore node_modules directory
set wildignore+=**/node_modules/**
" ignore vendor directory
set wildignore+=**/vendor/**
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
" insert parens, braces and quotes automatically and place cursor inside.
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ` ``<Esc>i
" }}}

" visual mode mappings {{{
" also keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv
" }}}

" local vimrc {{{
" if autochdir is 0 (false) and there is a .vimrc.local in the pwd
if (has('autochdir') == 0) && (filereadable(globpath('.', '.local.vimrc')))
    " if yes, load it up!
    let s:lvimrc_unresolved = fnamemodify('.local.vimrc', ':p')
    let s:lvimrc_resolved = resolve(s:lvimrc_unresolved)
    execute "source" . s:lvimrc_resolved
endif
" }}}
