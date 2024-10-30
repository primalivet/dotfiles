let g:fzf_layout = { 'down': '50%' }
let g:fzf_preview_window = {}

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=1 showmode ruler

