" let g:ale_disable_lsp = 1

let g:ale_linters_explicit = 1

let g:ale_floating_preview = 1

let g:ale_hover_to_floating_preview = 1

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint']
  \ }

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'typescript': ['eslint', 'prettier']
  \}
