vim.cmd[[syntax off]]
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt:append("fuzzy")
vim.opt.wildmode = "longest:full,full"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.laststatus = 1
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.grepprg = "grep -HInr --exclude-dir={node_modules,.git,build,dist} $* /dev/null"

function _G.findfunc_git(cmdarg)
  local pattern = '*' .. cmdarg .. '*'
  local cmd = { 'git', 'ls-files', pattern }
  local result = vim.system(cmd, { text = true }):wait()
  if result.code ~= 0 then return {} end
  return vim.split(result.stdout, '\n', { trimempty = true })
end

if vim.fs.root(0, '.git') then
  vim.opt.findfunc = 'v:lua.findfunc_git'
end

local group = vim.api.nvim_create_augroup("USER", {})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = group,
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = group,
  pattern = "*",
  callback = function()
    vim.treesitter.stop()
  end
})

vim.cmd[[colorscheme vim]]

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = group,
  pattern = "*",
  callback = function() vim.hl.on_yank() end
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  group = group,
  pattern = "*",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    client.server_capabilities.semanticTokensProvider = nil

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end
  end
})

vim.g.mapleader = " "

vim.keymap.set("v", "<", "<gv", { desc = "Keep visual selection while indenting left" })
vim.keymap.set("v", ">", ">gv", { desc = "Keep visual selection while indenting right" })
vim.keymap.set("n", "n", "nzz", { desc = "Center cursor on search jump natural direction" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center cursor on search jump unnatural direction" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Easily hit escape in terminal mode" })
vim.keymap.set("n", "<leader>s", ":set hlsearch!<CR>", { desc = "Toggle highlight search" })
vim.keymap.set("n", "<leader>n", ":set number!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist, { desc = "Add buffer diagnostics to quickfix list"})
vim.keymap.set("n", "<leader>g", ":grep ", { desc = "Find file content" })
vim.keymap.set("n", "<leader>f", ":find ", { desc = "Find file" })
vim.keymap.set("n", "<leader>b", ":ls<CR>:b ", { desc = "Switch to buffer" })

vim.cmd[[packadd! cfilter]]
vim.pack.add({
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/neovim/nvim-lspconfig"
})
vim.lsp.enable({ "clangd", "eslint", "gopls", "html", "jsonls", "lua_ls", "prismals", "pyright", "ts_ls", "bashls" })
