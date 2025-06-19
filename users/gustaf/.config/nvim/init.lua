local now, add, later = require 'user'.setup()

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,popup,fuzzy,noinsert"
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
vim.opt.grepprg = "grep -HInr $* /dev/null"

local group = vim.api.nvim_create_augroup("USER", {})

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
vim.keymap.set("n", "<leader>ts", ":set hlsearch!<CR>", { desc = "Toggle highlight search" })
vim.keymap.set("n", "<leader>tn", ":set number! relativenumber!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist, { desc = "Add buffer diagnostics to quickfix list"})
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Easily hit escape in terminal mode" })

now(function()
  require"mini.surround".setup{}
  add("nvim-treesitter/nvim-treesitter" )
  require "nvim-treesitter.configs".setup {
    auto_install = true,
    incremental_selection = { enable = true },
    highlight = { enable = true },
    indent = { enable = true }
  }
end)

now(function()
  add("tpope/vim-fugitive")
end)

now(function()
  require"mini.pick".setup{ window = { config = { width = math.floor(vim.o.columns) } } }
  vim.keymap.set("n", "<leader>sc", ":Pick commands<CR>", { desc = "Find commands" })
  vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Find files" })
  vim.keymap.set("n", "<leader>sl", ":Pick grep_live<CR>", { desc = "Find live in files" })
  vim.keymap.set("n", "<leader>sr", ":Pick resume<CR>", { desc = "Find resume" })
  vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>", { desc = "Find diagnostic" })
end)

now(function()
  add("neovim/nvim-lspconfig" ) -- since 0.11 only needed to provide $RTP/lsp
  vim.lsp.enable({ "clangd", "eslint", "gopls", "html", "jsonls", "lua_ls", "prismals", "pyright", "ts_ls", "bashls" })
end)

later(function()
  add("zbirenbaum/copilot.lua")
  require "copilot".setup {
    suggestion = { enable = true, auto_trigger = true,
      -- Resembles the default completion keymaps but with Modifier instead of Control
      keymap = { accept = "<M-y>", next = "<M-n>", prev = "<M-p>", dismiss = "<M-c>" }
    },
  }
end)

later(function()
  add({
    source = "olimorris/codecompanion.nvim",
    depends = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    }
  })
  local adapter = os.getenv("CODECOMPANION_MODEL") or "anthropic"
  require"codecompanion".setup {
    strategies = {
      chat = {
        adapter = adapter,
        keymaps = {
          -- Override omni completion
          completion = { modes = { i = "<C-x><C-o>" } }
        }
      },
      inline = { adapter = adapter }
    },
  }
end)
