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
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "Exafunction/codeium.vim",
      -- {
      --   "zbirenbaum/copilot.lua",
      --   cmd = "Copilot",
      --   event = "InsertEnter",
      --   config = function()
      --     require("copilot").setup({
      --       suggestion = { enable = false },
      --       panel = { enable = false },
      --     })
      --   end,
      -- },
      {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
          require("copilot_cmp").setup()
        end,
      },
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
        formatting = {
          format = require("tailwindcss-colorizer-cmp").formatter,
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
    end,
  },
}
