" if executable("rg")
"     set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
"     set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif

" command! -nargs=+ Search execute 'silent grep! <args>' | copen


lua require 'primalivet'.init()
