function! CreateBackupDir()
  if !isdirectory('~/.vim/backup/undo')
    call system('mkdir -p ~/.vim/backup/undo')
  endif
endfunction

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

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:errors = l:counts.error + l:counts.style_error
  let l:non_errors = l:counts.total - l:errors

  return l:counts.total == 0 ? 'OK ' : printf('%dE/%dW ', errors, non_errors)
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?''.l:branchname.' ':''
endfunction
