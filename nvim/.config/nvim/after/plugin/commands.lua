vim.cmd(":packadd cfilter") -- enable filter quickfix list

vim.api.nvim_create_user_command("ResetHunk", "Gitsigns reset_hunk", {})
vim.api.nvim_create_user_command("PreviewHunk", "Gitsigns preview_hunk", {})

-- Autocommands

local group_id = vim.api.nvim_create_augroup("PRIMALIVET", {})

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { group = group_id, pattern = "*.json", command = "set filetype=jsonc" }
)

-- When in FZF buffer, hide irrelavant stuff and show it again when the user
-- leaves the fzf buffer
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = group_id,
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
      group = group_id,
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