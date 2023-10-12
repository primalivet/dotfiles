local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "clangd", "cssls", "jsonls", "tailwindcss" },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-x>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp_signature_help", group_index = 3 },
    { name = "nvim_lsp", group_index = 3 },
    { name = "luasnip", group_index = 3 },
    { name = "nvim_lua", group_index = 3 },
    { name = "path", group_index = 3 },
    { name = "buffer", group_index = 3 },
    { name = "emoji", group_index = 5 },
    { name = "rg", group_index = 5 },
  }),
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "conventionalcommits", group_index = 1 },
    { name = "buffer", group_index = 3 },
    { name = "path", group_index = 3 },
    { name = "rg", group_index = 5 },
  }),
})
