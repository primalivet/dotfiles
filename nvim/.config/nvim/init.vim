" vim: fdm=marker
" set termguicolors " uses the gui (24 bit) colors in terminal

set nocompatible
filetype plugin indent on           " autoload filetype plugins and indent files

" plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'gerw/vim-HiLinkTrace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'primalivet/vim-realrealplain'
call plug#end()
" }}}

let g:lightline={'colorscheme': 'realrealplain'}

syntax on
set background=dark
colorscheme realrealplain

set number                          " linenumbers
set backspace=2                     " makes backspace act like you're used to
set scrolloff=5                     " start to scroll when cursor is < 5 rows from end of buffer
set showmatch                       " highlight matching brackets
set matchtime=1                     " hightlight matching brackets for 1/10 of a second
set autoindent                      " indent next line same as current line
set shiftround                      " round indent to multiples of shiftwidth
set splitright                      " open new vertical splits to the right
set splitbelow                      " open new horizontal splits to the botton
set path+=**                        " make the path smart when using :find etc. etc.
set laststatus=2                    "always show statusline
set noshowmode                      " show the current mode
set nobackup                        " don't backup before overwriting a file
set nowritebackup                   " if the :write wasn't successfull, everything is fucked
set noswapfile                      " dont use a swap file
set nowrap                          " dont wrap lines
set wildmenu                        " use tab completion when entering commands, a bit like bash
set wildmode=list:full              " list all completion options, and cycle through them
set wildignore=*/.git/*             " ignore git
set wildignore+=*/node_modules/*    " ignore node modules folder

let g:netrw_banner=0                " hide annoying banner
let g:netrw_browse_splits=4         " open files in same window, :Sex and :Vex for splits
let g:netrw_liststyle=3             " tree style listing

function! SortParagraph()
    :normal {jma}kmb
    :'a,'bsort
endfunction

" reload lightline
command! LightlineReload call LightlineReload()

function! LightlineReload()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

" whitespace stuff, move to plugin

let s:full_whitespace='trail:·,tab:>-,space:·,eol:┐'
let s:trail_whitespace='trail:·,tab:  ' " use blank tab, otherwise .c files show ^I char

if exists("s:full_whitespace") && exists("s:trail_whitespace")
    set list
    let &listchars=s:trail_whitespace               " define chars for whitespace
else 
    set list
    set listchars=trail:·
endif

function! ShowWhitespace()
    let &listchars=s:full_whitespace
endfunction

function! HideWhitespace()
    let &listchars=s:trail_whitespace
endfunction

function! ToggleWhitespace()
    if &listchars ==# s:full_whitespace
        call HideWhitespace()
        echom "settings listchars to " . &listchars
    else
        call ShowWhitespace()
        echom "setting listchars to " . &listchars
    endif
endfunction

" unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

command! W w
command! Q q

let mapleader=","

" disable annoying mode
nnoremap q: <Nop>
nnoremap Q <Nop>

" tab/shift tab and keep visual selection
" S-TAB doesn't work on WSL as the emulator insert
" a regular tab char when shift tab is pressed, ANNOYING!
vmap <S-TAB> <gv
vmap <TAB> >gv

" also keep visual selection on >  and < keys
vmap < <gv
vmap > >gv

" make j and k work on wrapped lines
nnoremap j gj
nnoremap k gk

" center stuff when focused
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" insert parens and braces automatically and place cursor inside.
inoremap ({<CR> ({<CR>})<C-o>O
inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap [<CR> [<CR>]<C-o>O

" split controls
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open netrw quickly!
nnoremap <leader>e :Explore<CR>

" unhighlight seach results
nnoremap <leader><Space> :nohlsearch<CR>

" sort inner paragraph
nnoremap <leader>sp :call SortParagraph()<CR>

" toggles between normal and hybrid line numbers
nnoremap <leader>ln :call ToggleRelativeNumbers()<CR>

" old ale plugin settings for javscript
" let g:ale_linters = { 'javascript': ['eslint'] }
" let g:ale_fixers = { 'javascript': ['prettier'] }
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_fix_on_save = 2
