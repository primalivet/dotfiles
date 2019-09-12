set nocompatible

" VIM PLUG AUTO INSTALL
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot' 
Plug 'airblade/vim-gitgutter'
Plug 'gerw/vim-HiLinkTrace'
Plug 'chriskempson/base16-vim'
call plug#end()

" NETRW PLUGIN SETTINGS
let g:netrw_banner = 0 " hide annoying banner
let g:netrw_browse_splits = 4 " open files in same window
let g:netrw_liststyle = 3 " tree style listing
let g:netrw_list_hide= netrw_gitignore#Hide() " hide same files as gitignore

" ALE PLUGIN SETTINGS
let g:ale_use_global_executables = 0 "only use local executables
let g:ale_linters_explicit = 1 " only run explicitlly set linters 
" explicitlly set linters
let g:ale_linters = { 
    \ 'javascript': ['eslint'], 
    \ }

" FZF
let g:fzf_layout = { 'down': '~50%'}
let g:fzf_colors = {
    \ 'fg': ['fg', 'Normal'],
    \ 'bg': ['bg', 'Normal'],
    \ 'hl': ['fg', 'Normal'],
    \ 'fg+': ['fg', 'Search'],
    \ 'bg+': ['bg', 'StatusLineNC'],
    \ 'hl+': ['fg', 'PreProc'],
    \ 'info': ['fg', 'Normal'],
    \ 'border': ['fg', 'Normal'],
    \ 'prompt': ['fg', 'Normal'],
    \ 'pointer': ['fg', 'Search'],
    \ 'marker': ['fg', 'Normal'],
    \ 'spinner': ['fg', 'Normal'],
    \ 'header': ['fg', 'Normal']
    \ }

" enable true color, https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" VIM SETTINGS
filetype plugin on " read filetype specific plugins
let mapleader=","
"set termguicolors
set background=dark
colorscheme base16-oceanicnext 
set cursorline
set nofoldenable
set formatoptions=tcroj " set formatoptions, se :h fo-table
set laststatus=1
set listchars=eol:$,tab:>--,space:·,trail:·
set matchtime=1 " hightlight matching brackets for 1/10 of a second
set noautochdir " dont set vim current dir to file dir
set nobackup
set nolist
set noswapfile
set nowrap
set nowritebackup " if the :write wasn't successfull, everything is fucked
set number
set path+=** " make the path smart when using :find etc. etc.
set scrolloff=5
set sidescrolloff=15
set hlsearch
set incsearch
set shiftround " round indent to multiples of shiftwidth
set showmatch
set showmode
set signcolumn=yes " always show error column
set splitbelow
set splitright
set textwidth=80
set timeout
set timeoutlen=500
set ttimeout
set ttimeoutlen=0 "do not delay on terminal input
set wildignore+=**/.git/**
set wildignore+=**/node_modules/**
set wildignore+=**/.next/**
set wildignore+=**/vendor/**
set wildmenu

" Remove background color from SignColumn and GitGutter
hi SignColumn guibg=NONE
hi LineNr guibg=NONE
hi GitGutterAdd guibg=NONE
hi GitGutterChange guibg=NONE
hi GitGutterDelete guibg=NONE
hi GitGutterChangeDelete guibg=NONE

" Save/Quit on capitalized command
command! W w
command! Q q

" auto insert quotes
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ` ``<ESC>i

" auto insert bracket pairs
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap { {}<ESC>i

" auto insert expected if fast typer
inoremap () ()
inoremap [] []
inoremap {} {}

" auto insert douple pairs
inoremap ({ ({})<ESC>F}i
inoremap ([ ([])<ESC>F]i

" auto insert block
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O

" increase the default width/height of window resize. this is still the
" default window resizing keymaps, se :h window-resize
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>

nnoremap Q <Nop>

" make j and k work on wrapped lines
nnoremap j gj
nnoremap k gk

" center stuff when focused
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" remap split controls to not use prefix
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open fuzzy finder
nnoremap <C-p> :Files<CR>

" open netrw
nnoremap <leader>e :Explore<CR>

" unhighlight seach results
nnoremap <leader><Space> :nohlsearch<CR>

" toggle between paste and nopaste
function! TogglePasteMode()
    if (&paste == 0)
        execute 'set paste'
        echo ':set paste'
    else 
        execute 'set nopaste'
        echo ':set nopaste'
    endif
endfunction

" toggle paste
nnoremap <leader>p :call TogglePasteMode()<CR>

" also keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv

" if autochdir is 0 (false) and there is a .vimrc.local in the pwd
if (&autochdir == 0) && (filereadable(globpath('.', '.local.vimrc')))
    let s:lvimrc_unresolved = fnamemodify('.local.vimrc', ':p')
    let s:lvimrc_resolved = resolve(s:lvimrc_unresolved)
    execute "source" . s:lvimrc_resolved
endif

