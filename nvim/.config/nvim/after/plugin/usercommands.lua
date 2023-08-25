vim.cmd(":packadd cfilter") -- enable filter quickfix list

vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})

vim.api.nvim_create_user_command("ResetHunk", "Gitsigns reset_hunk", {})
vim.api.nvim_create_user_command("PreviewHunk", "Gitsigns preview_hunk", {})

vim.api.nvim_create_user_command("Diagnostics", function()
  vim.diagnostic.setqflist({
    title = "Workspace Diagnostics",
  })
end, {})
