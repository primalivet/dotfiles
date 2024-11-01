set nocompatible

filetype plugin indent on
syntax on

colorscheme sixteen

" Options
" -----------------------------------------------------------------------------

set showmatch matchtime=2
set backspace=indent,eol,start
set clipboard^=unnamed | if has('unnamedplus') | set clipboard^=unnamedplus | endif
set completeopt=menu,popup,longest
set grepprg=rg\ --vimgrep\ --no-heading\ --hidden grepformat=%f:%l:%c:%m
set hidden
set incsearch ignorecase smartcase inccommand=split
set nobackup noswapfile undofile
set nowrap scrolloff=5 sidescrolloff=5
set path+=**,vim/.vim/**,nvim/.config/**
set showcmd ruler laststatus=2
set signcolumn=yes
set timeoutlen=500
set wildignore+=**/node_modules/**,**/_build/**,**bin**,**/_opam/**,**/pack/user/**
set wildmenu wildmode=lastused:list:full
set listchars+=tab:>\ ,space:·,trail:·,nbsp:+

lua vim.diagnostic.config { virtual_text = false }

" Packages
" -----------------------------------------------------------------------------

packadd cfilter
packadd vim-fugitive
packadd fzf
packadd fzf.vim
packadd nvim-treesitter
packadd nvim-lspconfig
packadd copilot.lua

" Mappings
" -----------------------------------------------------------------------------

let g:mapleader=" "

nnoremap se :edit **/

" Keep visual selection while indenting
vnoremap < <gv
vnoremap > >gv

" Move visual selection up and down
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+<CR>gv=gv

" !column -t on visual selection
vnoremap <leader>c :'<,'>!column -t<CR>

" Center cursor on search jump
nnoremap n nzz
nnoremap N Nzz

" Toggle listchars
nnoremap <leader>tl :set list!<CR>

" Toggle search highlight
nnoremap <leader>ts :set hlsearch!<CR>

" Toggle number and relative numbers
nnoremap <leader>tn :set number! relativenumber!<CR>

" Search keymaps
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sl :Rg<CR>

" Format whole buffer
nnoremap <leader>= :%normal! gg=G<CR>

" Add buffer diagnostics to location list
nnoremap <leader>d :lua vim.diagnostic.setloclist()<CR>

" Escape in the terminal
tnoremap <Esc> <C-\><C-n>

" Autocommands
" -----------------------------------------------------------------------------

" Highlight on yank
augroup HighlightYanked
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=200}
augroup END

augroup HighlightIncSearch
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

augroup LanguageServerConnect
	" HINT: the <leader>gq mappings below is here rather then general since
	" the neovim sets the 'formatexpr' to vim.lsp.formatexpr() on LspAttach.
	" However, since most ts/js projects use prettier (instead of typescript
	" lsp for mysterious reasons) we override the mapping for ts/js files.
	"
	" HINT: the mf an 'f in the <leader>gq mappings sets a mark we can jump
	" back to.
	autocmd!
	autocmd LspAttach * nnoremap <buffer> <leader>gq mf:%normal! gggqG<CR>'f
	autocmd LspAttach *.ts,*.tsx,*.js,*.jsx nnoremap <buffer> <leader>gq mf:%!./node_modules/.bin/prettier --stdin-filepath %<CR>'f
	autocmd LspAttach * nnoremap <buffer> grn :lua vim.lsp.buf.rename()<CR>
	autocmd LspAttach * nnoremap <buffer> gra :lua vim.lsp.buf.code_action()<CR>
	autocmd LspAttach * nnoremap <buffer> grr :lua vim.lsp.buf.references()<CR>
	autocmd LspAttach * inoremap <buffer> <C-s> :lua vim.lsp.buf.signature_help()<CR>
augroup END
