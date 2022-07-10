vim.cmd(":packadd cfilter") -- enable filter quickfix list
vim.cmd("command! ReloadConfig lua reload_config()<CR>")

vim.cmd([[
  augroup PRIMA_FILETYPES
    autocmd BufRead,BufNewFile *.json set filetype=jsonc
  augroup END
]])

-- TODO: if have gitsigns
vim.cmd("command! ResetHunk Gitsigns reset_hunk")
vim.cmd("command! PreviewHunk Gitsigns preview_hunk")

-- TODO: if have fzf
vim.cmd([[
  augroup UserFZF!
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
  augroup END
]])
