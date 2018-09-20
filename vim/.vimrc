function! ToggleRelativeNumbers()
  if &relativenumber 
    set number norelativenumber
  else 
    set number relativenumber 
  endif
endfunction

function! SortParagraph()
  :normal {jma}kmb  
  :'a,'bsort
endfunction

syntax on
set background=dark

set expandtab tabstop=2 softtabstop=2
set shiftwidth=2 shiftround
set autoindent
set hlsearch incsearch
set ignorecase smartcase
set showmatch matchtime=1
set backspace=2
set scrolloff=5
set showcmd
set number
set list listchars=trail:·,tab:▸\ 
set wildmenu wildignore=*/.git/*,*/node_modules/*
set path+=**

let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_splits=4
let g:netrw_liststyle=3

command! W w
command! Q q

let mapleader=","

" disable annoying mode
nnoremap q: <Nop>
nnoremap Q <Nop>

" tab/shift tab and keep visual selection
vmap <S-TAB> <gv
vmap <TAB> >gv

" also keep visual selection on >  and < keys
vmap < <gv
vmap > >gv

" make j and k work on wrapped lines
nnoremap j gj
nnoremap k gk

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

" sort inner paragraph
nnoremap <leader>sp :call SortParagraph()<CR>

" toggles between normal and hybrid line numbers
nnoremap <leader>ln :call ToggleRelativeNumbers()<CR>

" old ale plugin settings for javscript
" let g:ale_linters = { 'javascript': ['eslint'] }
" let g:ale_fixers = { 'javascript': ['prettier'] }
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_fix_on_save = 1

