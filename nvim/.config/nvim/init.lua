local now, add = require'user'.setup()

-- Options
--------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true
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
vim.opt.smartindent = true

-- Autocommands
--------------------------------------------------------------------------------

local group = vim.api.nvim_create_augroup("USER", {})

vim.api.nvim_create_autocmd({"TextYankPost"}, {
  group = group,
  pattern = "*",
  callback = function() vim.highlight.on_yank() end
})

-- Keymaps
--------------------------------------------------------------------------------

vim.g.mapleader = " "

-- Keep visual selection while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Center cursor on search jump
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Add buffer diagnostics to location list
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

-- Syntax
--------------------------------------------------------------------------------

now(function() 
  add({ source = 'nvim-treesitter/nvim-treesitter' })
  require"nvim-treesitter.configs".setup {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true }
  }
end)


-- Language servers
--------------------------------------------------------------------------------

now(function() 
  add({ source = 'neovim/nvim-lspconfig' })
  local lspconfig_util = require'lspconfig.util'
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  require"lspconfig".clangd.setup{ capabilities = capabilities }
  require"lspconfig".ts_ls.setup{ 
    capabilities = capabilities, 
    root_dir = lspconfig_util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json'), 
    single_file_support = false,
  }
  require"lspconfig".prismals.setup{ capabilities = capabilities }
  require"lspconfig".eslint.setup{ capabilities = capabilities }
  require"lspconfig".cssls.setup{ capabilities = capabilities }
  require"lspconfig".html.setup{ capabilities = capabilities }
  require"lspconfig".jsonls.setup{ capabilities = capabilities }
  require"lspconfig".gopls.setup{ capabilities = capabilities }
  require'lspconfig'.denols.setup{ 
    capabilities = capabilities,
    root_dir = lspconfig_util.root_pattern('deno.jsonc', 'deno.json'), 
    single_file_support = false
  }


  vim.api.nvim_create_autocmd({"LspAttach"}, {
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

      vim.keymap.set("n", "grn", vim.lsp.buf.rename)
      vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
      vim.keymap.set("n", "grr", vim.lsp.buf.references)
      vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help)
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
      { 
        source = "nvim-telescope/telescope-fzf-native.nvim", 
        hooks = { 
          post_install = function(ctx) 
            vim.system({'make'}, { cwd = ctx.path }) 
          end
        }
      }
    } 
  })
  require'telescope'.setup {
    defaults = {
      preview = false,
    },
    extensions = { fzf = {} }
  }
  require('telescope').load_extension('fzf')

  vim.keymap.set("n", "<leader>sf", require'telescope.builtin'.find_files)
end)

-- Git
--------------------------------------------------------------------------------

now(function()
  add({ source = "lewis6991/gitsigns.nvim" })
  require'gitsigns'.setup{}
  vim.keymap.set("n", "]h", require'gitsigns'.next_hunk)
  vim.keymap.set("n", "[h", require'gitsigns'.prev_hunk)

end)

-- AI
--------------------------------------------------------------------------------

now(function()
  add({ source = "zbirenbaum/copilot.lua" })
  require"copilot".setup {
    suggestion = { enable = false },
    panel = { enable = true, auto_refresh = true }
  }
end)

-- Other
--------------------------------------------------------------------------------

-- Adapt theme to terminal foreground/background
vim.api.nvim_set_hl(0, "Normal", { fg = "#D1D3D6", bg = "#1A1D21" })

