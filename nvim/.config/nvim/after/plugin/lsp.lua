local lsp_zero = require("lsp-zero")
local lsp_conf = require("lspconfig")
local luasnip = require("luasnip")
local mason = require("mason")
local mason_lspconf = require("mason-lspconfig")
local cmp = require("cmp")

lsp_zero.on_attach(function(client, _)
  -- disable virtual text
  vim.diagnostic.handlers.virtual_text = {}

  if client.name == "tsserver" then
    -- disable tsserver formatting
    client.server_capabilities.document_formatting = false
  end
end)

-- make the lua-langauge-server work in neovim environment
local lua_opts = lsp_zero.nvim_lua_ls()
lsp_conf.lua_ls.setup(lua_opts)

-- Add json schemas
lsp_conf.jsonls.setup({
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- Add yaml schemas
lsp_conf.yamlls.setup({
  settings = {
    yaml = {
      schemaStore = {
        -- recommended config from author: https://github.com/b0o/SchemaStore.nvim
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

lsp_conf.ocamllsp.setup({

})

-- Install servers
mason.setup({})
mason_lspconf.setup({
  -- Manual (not supported by Mason registery): eslint_d, prettierd, stylua, clang-format, commitlint
  ensure_installed = { "tsserver", "clangd", "cssls", "jsonls", "yamlls", "html", "tailwindcss", "lua_ls", "prismals" },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Completion
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
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
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
