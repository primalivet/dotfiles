function! ToggleRelativeNumbers()
  if &relativenumber
    set number norelativenumber
  else
    set number relativenumber
  endif
endfunction
