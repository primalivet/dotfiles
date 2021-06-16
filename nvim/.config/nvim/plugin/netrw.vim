" hide annoying banner
let g:netrw_banner = 0

" open files in same window
let g:netrw_browse_splits = 4

" tree style listing
let g:netrw_liststyle = 3

" hide same files as gitignore
let g:netrw_list_hide= netrw_gitignore#Hide()
