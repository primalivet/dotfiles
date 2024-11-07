
colorscheme turbo

" Options
" -----------------------------------------------------------------------------
set guicursor=
set showmatch matchtime=2
set clipboard^=unnamed | if has('unnamedplus') | set clipboard^=unnamedplus | endif
set completeopt=menu,popup,longest
set ignorecase smartcase inccommand=split
set nobackup noswapfile undofile
set nowrap
set path+=**,vim/.vim/**,nvim/.config/**
set wildignore+=**/node_modules,**/dist,**/_build,**/_opam,**/nvim/pack,**/.git
set wildmenu wildmode=lastused:list:full wildoptions=fuzzy,tagfile
set listchars+=tab:>\ ,space:·,trail:·,nbsp:+
set signcolumn=auto

if system('git rev-parse --is-inside-work-tree 2> /dev/null') =~ 'true'
		set grepprg=git\ --no-pager\ grep\ -rni\ --no-color\ --untracked\ --exclude-standard\ $*
		set grepformat=%f:%l:%m,\ %m
		set findfunc=findfunc#GitFiles
else 
		set grepprg=grep\ -rni\ --exclude-dir={dist,build,node_modules,.git}\ $*
		set grepformat=%f:%l:%m,\ %m
		" TODO: make this work properly, should have a max count, maybe max
		" depth? Should not trigger prompt when autocompleting
		"set findfunc=findfunc#Find
endif

lua vim.diagnostic.config { virtual_text = false, float = { border = 'shadow' }}

" Packages
" -----------------------------------------------------------------------------

packadd cfilter
packadd vim-fugitive
packadd fzf
packadd fzf.vim
packadd nvim-treesitter
packadd nvim-lspconfig
packadd gitsigns.nvim
packadd copilot.lua

" Mappings
" -----------------------------------------------------------------------------

let g:mapleader=" "

" Keep visual selection while indenting
vnoremap < <gv
vnoremap > >gv

" Move visual selection up and down
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+<CR>gv=gv

" Open current buffer in diff split, move to $LOCAL and center
nnoremap <leader>ds :Gdiffsplit<CR><C-W>lzz

" !column -t on visual selection
vnoremap <leader>c :'<,'>!column -t<CR>

" Open quickfix if it has any items
nnoremap <leader>q :cwindow<CR>

" List buffers and be ready to select
nnoremap <leader>b :ls<CR>:b<Space>

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
