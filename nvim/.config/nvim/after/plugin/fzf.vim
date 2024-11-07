let g:fzf_layout = { 'down': '30%' }
let g:fzf_preview_window = {}

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

