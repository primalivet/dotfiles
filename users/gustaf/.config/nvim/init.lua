local now, add, later = require 'user'.setup()

-- Options
--------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 3
vim.opt.smartindent = true
vim.opt.completeopt = "menuone,popup,fuzzy,noinsert"

-- Autocommands
--------------------------------------------------------------------------------

local group = vim.api.nvim_create_augroup("USER", {})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = group,
  pattern = "*",
  callback = function() vim.hl.on_yank() end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})


-- Keymaps
--------------------------------------------------------------------------------

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

-- Misc
--------------------------------------------------------------------------------

now(function()
  require'mini.icons'.setup{}
  require'mini.extra'.setup{}
  require'mini.surround'.setup{}
  require'mini.git'.setup{}
  require'mini.diff'.setup{}
  vim.keymap.set("n", "ho", MiniDiff.toggle_overlay, { desc = "Toggle diff overlay" })
end)

-- Syntax
--------------------------------------------------------------------------------

now(function()
  add({ source = 'nvim-treesitter/nvim-treesitter' })
  require "nvim-treesitter.configs".setup {
    auto_install = true,
    incremental_selection = { enable = true },
    highlight = { enable = true },
    indent = { enable = true }
  }
end)


-- Language servers
--------------------------------------------------------------------------------

now(function()
  add({ source = 'neovim/nvim-lspconfig' })
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local servers = {
    clangd = {},
    prismals = {},
    eslint = {},
    cssls = {},
    html = {
      filetypes = { "html", "templ", "htmlangular" }
    },
    jsonls = {},
    gopls = {},
    pyright = {},
    lua_ls = { settings = { Lua = {} } },
    denols = {
      root_dir = function(fname)
        return vim.fs.root(fname, {'deno.jsonc', 'deno.json'})
      end,
      single_file_support = false
    },
    ts_ls = {
      root_dir = function(fname)
        return vim.fs.root(fname, { 'tsconfig.json', 'jsconfig.json', 'package.json'})
      end,
      single_file_support = false
    }
  }

  for name, settings in pairs(servers) do
    local combines = vim.tbl_extend('force', { capabilities = capabilities }, settings)
    require'lspconfig'[name].setup(combines)
  end

  vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = group,
    pattern = "*",
    callback = function()
      -- HINT: the <leader>gq mappings below is here rather then general since
      -- the neovim sets the 'formatexpr' to vim.lsp.formatexpr() on LspAttach.
      -- However, since most ts/js projects use prettier (instead of typescript
      -- lsp for mysterious reasons) we override the mapping for ts/js files.
      --
      -- HINT: the mf an 'f in the <leader>gq mappings sets a mark we can jump
      -- back to.

      -- TODO: get client, if == ts_ls, dont format with lsp, use <leader>gq
      -- autocmd LspAttach * nnoremap <buffer> <leader>gq mf:%normal! gggqG<CR>'f
      -- autocmd LspAttach *.ts,*.tsx,*.js,*.jsx nnoremap <buffer> <leader>gq mf:%!./node_modules/.bin/prettier --stdin-filepath %<CR>'f

      vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "List line code actions" })
      vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "List symbol references" })
      vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { desc = "Open signature help" })
    end
  })
end)

-- Search
--------------------------------------------------------------------------------

now(function()
  require'mini.pick'.setup{
    window = {
      config = function()
        return {
          border = "double", anchor = "SW",
          height = math.floor(vim.o.lines / 2),
          width = math.floor(vim.o.columns)
        }
      end
    }
  }
  vim.ui.select = MiniPick.ui_select
  vim.keymap.set("n", "<leader>sc", ":Pick commands<CR>", { desc = "Find commands" })
  vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Find files" })
  vim.keymap.set("n", "<leader>sl", ":Pick grep_live<CR>", { desc = "Find live in files" })
  vim.keymap.set("n", "<leader>sr", ":Pick resume<CR>", { desc = "Find resume" })
  vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>", { desc = "Find diagnostic" })
end)

-- AI
--------------------------------------------------------------------------------

later(function()
  add({
    source = "olimorris/codecompanion.nvim",
    depends = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" }
  })

  -- "anthropic" (default) or "copilot" supported for now
  local adapter = os.getenv("CODECOMPANION_MODEL") or "anthropic"

  require'codecompanion'.setup {
    strategies = {
      chat = {
        adapter = adapter,
        keymaps = {
          completion = { modes = { i = "<C-x><C-a>" } }
        }
      },
      inline = { adapter = adapter }
    }
  }
end)

later(function()
  add({ source = "zbirenbaum/copilot.lua" })
  require "copilot".setup {
    suggestion = { enable = true, auto_trigger = true,
      -- Resembles the default completion keymaps but with Modifier instead of Control
      keymap = {
        accept = "<M-y>",
        next = "<M-n>",
        prev = "<M-p>",
        dismiss = "<M-c>"
      }
    },
    panel = { enable = false, auto_refresh = true }
  }

  add({
    source = "yetone/avante.nvim",
    monitor = "main",
    depends = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
    },
    hooks = { post_checkout = function() vim.cmd("make") end }
  })

  local model = os.getenv("AVANTE_MODEL") or "claude"

  require"avante".setup {
    provider = model,
    windows = {
      width = 50,
      sidebar_header = { enabled = false },
      edit = { border = "double" },
    }
  }
end)

-- Other
--------------------------------------------------------------------------------

now(function()
  add({
    source = "MeanderingProgrammer/render-markdown.nvim",
    depends = {"nvim-treesitter/nvim-treesitter"}
  })
  require"render-markdown".setup {
    file_types = { 'markdown', 'Avante' },
    overrides = {
      filetype = {
        markdown = { sign = { enabled = false } },
        Avante = { sign = { enabled = false } },
        codecompanion = { sign = { enabled = false } }
      }
    }
  }
end)

-- Temporary fix for "global" border for floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "double"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Diagnositcs config
vim.diagnostic.config{
  virtual_text = { severity = vim.diagnostic.severity.WARN },
  float = {  source = true }
}


-- Colorscheme
---------------------------------------------------------------------------------

vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#cbf9cb", bg = "#074008" })
vim.api.nvim_set_hl(0, "DiffChange", { fg = "#cbf9f1", bg = "#074037" })
vim.api.nvim_set_hl(0, "DiffText", { fg = "#cbf9f1", bg = "#0b6456" })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#f9cbcb", bg = "#400707" })
