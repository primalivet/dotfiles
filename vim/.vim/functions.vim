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
