local ok, cmp = pcall(require, "cmp")

if not cmp then
  print("CMP not found")
  return
end

local ok, luasnip = pcall(require, "luasnip")

if not luasnip then
  print("luasnip not found")
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "copilot", group_index = 1 },
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
