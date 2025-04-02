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
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "List line code actions" })
    vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "List symbol references" })
    vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { desc = "Open signature help" })
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
vim.keymap.set("n", "<leader>ds", ":Gdiffsplit<CR>", { desc = "Git diff split current file" })
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
  require"mini.diff".setup{}
  vim.keymap.set("n", "ho", require"mini.diff".toggle_overlay, { desc = "Toggle hunk overlay" })
  add("tpope/vim-fugitive")
end)

now(function()
  require"mini.pick".setup{ window = { config = { width = math.floor(vim.o.columns) } } }
  vim.ui.select = MiniPick.ui_select
  vim.keymap.set("n", "<leader>sc", ":Pick commands<CR>", { desc = "Find commands" })
  vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Find files" })
  vim.keymap.set("n", "<leader>sl", ":Pick grep_live<CR>", { desc = "Find live in files" })
  vim.keymap.set("n", "<leader>sr", ":Pick resume<CR>", { desc = "Find resume" })
  vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>", { desc = "Find diagnostic" })
end)

now(function()
  add("neovim/nvim-lspconfig" )
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local servers = {
    clangd = {},
    cssls = {},
    eslint = {},
    gopls = {},
    html = {},
    jsonls = {},
    lua_ls = {},
    prismals = {},
    pyright = {},
    denols = {
      root_dir = function(fname) return vim.fs.root(fname, {"deno.jsonc", "deno.json"}) end,
      single_file_support = false
    },
    ts_ls = {
      root_dir = function(fname) return vim.fs.root(fname, { "tsconfig.json", "jsconfig.json", "package.json"}) end,
      single_file_support = false
    }
  }

  for name, settings in pairs(servers) do
    local combines = vim.tbl_extend("force", { capabilities = capabilities }, settings)
    require"lspconfig"[name].setup(combines)
  end

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
      "echasnovski/mini.nvim"
    }
  })
  local adapter = os.getenv("CODECOMPANION_MODEL") or "copilot"
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
    display = { diff = { provider = "mini_diff" } }
  }
end)
