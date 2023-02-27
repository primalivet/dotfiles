return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "davidsierradz/cmp-conventionalcommits",
    },
    config = function()
      local cmp = require("cmp")
      if not cmp then
        -- Lsp seem to not recognize type of nvim-cmp
        return print("Neovim CMP not present")
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
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "path" },
          { name = "buffer" },
        }, {
          { name = "emoji" },
          { name = "rg" },
        }),
      })
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "conventionalcommits" },
          { name = "buffer" },
          { name = "path" },
        }, {
          { name = "rg" },
        }),
      })
    end,
  },
}
