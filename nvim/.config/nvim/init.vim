syntax on
filetype plugin on
filetype plugin indent on

set expandtab sr sta ts=2 sw=2 sts=2 " 1 tab=2 spaces
set foldenable fdl=999 fdm=indent    " use folds by indent, dont fold at start
set list lcs=tab:>--,space:·,trail:· " show invisibles
set scrolloff=5 sidescrolloff=5      " scroll view when cursor gets close to edge
set number relativenumber            " show numbers, relative to current row
set ignorecase smartcase             " only be case sensitive when i type CAPS
set nobackup nowritebackup           " No backups, seems to be a problem with some lsps
set timeoutlen=500 updatetime=100    " timeout for mappings and updatetime for events
set textwidth=80 nowrap              " max text width 80, but dont wrap
set cursorline                       " show what line im on
set hidden                           " Files and Buffers
set termguicolors                    " use more colors than before :)
set laststatus=1

let mapleader=" "                             " use <Space> as a special 'leader' key

let g:netrw_banner = 0                        " hide annoying banner
let g:netrw_browse_splits = 4                 " open files in same window
let g:netrw_liststyle = 3                     " tree style listing
let g:netrw_list_hide= netrw_gitignore#Hide() " hide same files as gitignore

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'bg0'

" make j and k work on wrapped lines
nnoremap j gj
nnoremap k gk

" remap split controls to not use prefix
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" keep visual selection on >  and < keys
vnoremap < <gv
vnoremap > >gv

" Edit
nnoremap <leader>er :lua vim.lsp.buf.rename()<CR>
vnoremap <leader>es :'<,'>sort<CR>
nnoremap <leader>ea :lua vim.lsp.buf.code_action()<CR>

" GoTo
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>gs :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gf gf

" Search
nnoremap <leader>sf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>sg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>sc :lua require('telescope.builtin').current_buffer_fuzzy_find({ previewer = false, sorting_strategy="ascending" })<CR>
nnoremap <leader>sb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>s* :lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>s/ :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>sd :lua require('primalivet.plugins.telescope').dotfiles()<CR>

" Toggle
nnoremap <leader>tl :set list!<CR>
nnoremap <leader>tp :set invpaste<CR>
nnoremap <leader>ts :set hlsearch!<CR>

" Vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" Previous and Next of problems, git hunks etc
nnoremap [q :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]q :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap ]c :lua require('gitsigns.actions').next_hunk()<CR>
nnoremap [c :lua require('gitsigns.actions').prev_hunk()<CR>

" source lua files
lua require 'primalivet'.init()

colorscheme brickor
