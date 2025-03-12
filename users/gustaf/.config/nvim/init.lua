local now, add, later = require 'user'.setup()

-- Options
--------------------------------------------------------------------------------

vim.opt.number = false
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

-- Syntax
--------------------------------------------------------------------------------

now(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- TODO: Getting error with this dependency, look into it
    -- depends = { "nvim-treesitter/nvim-treesitter-textobjects" }
  })
  require "nvim-treesitter.configs".setup {
    auto_install = true,
    incremental_selection = { enable = true },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        }
      },
      swap = {
        enable = true,
        swap_next = { ["<leader>a"] = "@parameter.inner" },
        swap_previous = { ["<leader>A"] = "@parameter.inner" },
      }
    },
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
  add({
    source = "nvim-telescope/telescope.nvim",
    checkout = "0.1.8",
    depends = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        source = "nvim-telescope/telescope-fzf-native.nvim",
        hooks = {
          post_install = function(ctx)
            vim.system({ 'make' }, { cwd = ctx.path })
          end
        }
      }
    }
  })
  local telescope = require 'telescope'
  local builtin = require 'telescope.builtin'
  local themes = require 'telescope.themes'

  telescope.setup {
    defaults = { preview = false },
    pickers = {
      builtin = { theme = "ivy" },
      find_files = { theme = "ivy" },
      live_grep = { theme = "ivy" }
    },
    extensions = { fzf = {}, ['ui-select'] = { themes.get_ivy {} } }
  }
  pcall(telescope.load_extension, 'fzf')
  pcall(telescope.load_extension, 'ui-select')

  vim.keymap.set("n", "<leader>sc", builtin.builtin, { desc = "Find builtin Telescope commands" })
  vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
  vim.keymap.set("n", "<leader>sl", builtin.live_grep, { desc = "Grep in files" })
end)

-- Git
--------------------------------------------------------------------------------

now(function()
  add({ source = "tpope/vim-fugitive" })
  add({ source = "lewis6991/gitsigns.nvim" })
  require 'gitsigns'.setup {}
  vim.keymap.set("n", "]h", require 'gitsigns'.next_hunk, { desc = "Go to next git hunk" })
  vim.keymap.set("n", "[h", require 'gitsigns'.prev_hunk, { desc = "Go to previous git hunk" })
end)

-- AI
--------------------------------------------------------------------------------

later(function()
  add({ source = "zbirenbaum/copilot.lua" })

  add({
    source = "yetone/avante.nvim",
    monitor = "main",
    depends = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.icons",
      -- Optional
      "zbirenbaum/copilot.lua",
      "MeanderingProgrammer/render-markdown.nvim"
    },
    hooks = { post_checkout = function() vim.cmd("make") end }
  })

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

  local model = os.getenv("AVANTE_MODEL") or "claude"

  require"avante".setup {
    provider = model,
  }
end)

-- Other
--------------------------------------------------------------------------------

now(function()
  require'mini.surround'.setup{}
end)

-- Diagnositcs config
vim.diagnostic.config{
  virtual_text = { severity = vim.diagnostic.severity.WARN },
  float = { border = "shadow", source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "◉",
      [vim.diagnostic.severity.INFO] = "◎",
      [vim.diagnostic.severity.HINT] = "◯",
    }
  },
}

-- Adapt theme to terminal foreground/background
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#cbf9cb", bg = "#074008" })
vim.api.nvim_set_hl(0, "DiffChange", { fg = "#cbf9f1", bg = "#074037" })
vim.api.nvim_set_hl(0, "DiffText", { fg = "#cbf9f1", bg = "#0b6456" })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#f9cbcb", bg = "#400707" })
