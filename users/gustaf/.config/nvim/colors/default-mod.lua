vim.g.colors_name = "default-mod"
vim.opt.termguicolors = false

local augroup = vim.api.nvim_create_augroup("USER_DEAFULT_MOD", {})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = augroup, pattern = "*",
  callback = function()
    vim.cmd[[syntax off]]
    vim.opt.termguicolors = false
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Identifier", { fg = "NONE" })
    vim.api.nvim_set_hl(0, "Function", { fg = "NONE" })
    vim.api.nvim_set_hl(0, "Special", { fg = "NONE" })
  end
})

vim.cmd[[colorscheme default]]
