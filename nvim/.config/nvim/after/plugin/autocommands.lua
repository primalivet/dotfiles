local group = vim.api.nvim_create_augroup("PRIMALIVET", {})

vim.api.nvim_create_autocmd({ "BufRead", "DirChanged" }, {
  group = group,
  pattern = "*",
  callback = function()
    if not string.match(vim.fn.getcwd(), "/Code/OSS") then
      vim.cmd("CodeiumDisable")
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, { group = group, command = "wincmd=" })

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  group = group,
  pattern = "*",
  command = "normal zR",
})

vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
  group = group,
  pattern = "*",
  callback = function()
    if vim.fn.pumvisible == 0 then
      -- Somehow DiagnosticsChanged seem to trigger in pmenu
      vim.diagnostic.setloclist({ open = false, title = "Buffer Diagnostics" })
    end
  end,
})

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { group = group, pattern = "*.json", command = "set filetype=jsonc" }
)

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = group,
  pattern = "*.tf,*.tfvars",
  callback = function()
    vim.cmd([[set filetype=terraform]])
    vim.cmd([[setlocal commentstring=#\ %s]])
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = group,
  pattern = "*.fs,*.fsx,*.fsi",
  callback = function()
    vim.cmd([[set filetype=fsharp]])
    vim.cmd([[setlocal commentstring=//\ %s]])
  end,
})

vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" },
  { group = group, pattern = "*.fsproj", command = "set filetype=xml" }
)
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = group,
  pattern = "zsh",
  command = "set filetype=bash",
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = group,
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
})

