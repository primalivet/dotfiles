local group = vim.api.nvim_create_augroup("PRIMALIVET", {})

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
    vim.diagnostic.setloclist({ open = false, title = "Buffer Diagnostics" })
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

-- When in FZF buffer, hide irrelavant stuff and show it again when the user
-- leaves the fzf buffer
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = group,
  pattern = "fzf",
  callback = function()
    local user_opts = {
      laststatus = vim.opt.laststatus:get(),
      showmode = vim.opt.showmode:get(),
      ruler = vim.opt.ruler:get(),
      number = vim.opt.number:get(),
      relativenumber = vim.opt.relativenumber:get(),
    }
    vim.opt.laststatus = 0
    vim.opt.showmode = false
    vim.opt.ruler = false
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.api.nvim_create_autocmd({ "BufLeave" }, {
      group = group,
      buffer = 0,
      callback = function()
        vim.opt.laststatus = user_opts.laststatus
        vim.opt.showmode = user_opts.showmode
        vim.opt.ruler = user_opts.ruler
        vim.opt.number = user_opts.number
        vim.opt.relativenumber = user_opts.relativenumber
      end,
    })
  end,
})
