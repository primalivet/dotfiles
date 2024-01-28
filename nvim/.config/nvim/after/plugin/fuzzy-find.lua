local function build_quickfix_list(lines)
  print(vim.inspect(lines))
end

-- function! s:build_quickfix_list(lines)
--   call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
--   copen
--   cc
-- endfunction
vim.g.fzf_layout = { down = "30%" }
vim.g.fzf_preview_window = {}
vim.g.fzf_action = { ["ctrl-q"] = build_quickfix_list, ["ctrl-x"] = "split", ["ctrl-v"] = "vsplit" }
