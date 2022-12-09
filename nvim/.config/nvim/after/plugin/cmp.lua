local cmp_ok, cmp = pcall(require, "cmp")

if not cmp_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
  }, {
    { name = "emoji" },
    { name = "path" },
    { name = "buffer" },
    { name = "rg" },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[buffer]",
        nvim_lsp = "[lsp]",
        luasnip = "[snippet]",
        nvim_lua = "[nvimlua]",
        path = "[path]",
        nvim_lsp_signature_help = "[signature]",
        rg = "[rg]",
      })[entry.source.name]
      return vim_item
    end,
  },
})
