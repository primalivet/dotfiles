lua << EOF
require 'primalivet.lsp'
require 'primalivet.compe'
EOF

" let g:ale_disable_lsp = 1

" let g:ale_linters_explicit = 1
" let g:ale_floating_preview = 1
" let g:ale_hover_to_floating_preview = 1

" let g:ale_linters = {
"   \ 'javascript': ['eslint'],
"   \ 'typescript': ['eslint']
"   \ }

" let g:ale_fixers = {
"   \ 'javascript': ['eslint', 'prettier'],
"   \ 'typescript': ['eslint', 'prettier']
"   \}

" hide annoying banner
let g:netrw_banner = 0
" open files in same window
let g:netrw_browse_splits = 4
" tree style listing
let g:netrw_liststyle = 3
" hide same files as gitignore
let g:netrw_list_hide= netrw_gitignore#Hide()

let g:fzf_layout = { 'down': '50%' }

set background=light
set termguicolors " not with theme terminal16

let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_sign_column = 'bg0'

syntax on
colorscheme gruvbox

" " Black on Yello TODO
" highlight Todo guifg=#1d2021 guibg=#fabd2f

" " Use bg1 'hard'
" highlight FoldColumn guibg=#1d2021
