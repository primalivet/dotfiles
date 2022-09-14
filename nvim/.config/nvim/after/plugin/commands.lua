vim.cmd(":packadd cfilter") -- enable filter quickfix list

vim.api.nvim_create_user_command("ResetHunk", "Gitsigns reset_hunk", {})
vim.api.nvim_create_user_command("PreviewHunk", "Gitsigns preview_hunk", {})

vim.api.nvim_create_user_command("Diagnostics", function()
  print("put in qf list")
  vim.diagnostic.setqflist({
    title = "Workspace Diagnostics",
  })
end, {})

-- Autocommands

local group = vim.api.nvim_create_augroup("PRIMALIVET", {})

vim.api.nvim_create_autocmd({ "VimResized" }, { group = group, command = "wincmd=" })

vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter" }, {
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
