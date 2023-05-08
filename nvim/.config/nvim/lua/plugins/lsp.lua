return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "b0o/schemastore.nvim",
      "ionide/Ionide-vim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_ts_utils = require("nvim-lsp-ts-utils")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

      do
        -- Control lsp diagnostics
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = false,
          signs = true,
          update_in_insert = false,
        })
      end

      local function on_attach(client, _)
        -- Disable LSP formatting for all language server
        -- In most cases I tend to use null-ls for formatting and linting, as
        -- they are generally better to configure with widley used tools such
        -- as prettier and eslint.
        client.server_capabilities.documentFormattingProvider = false

        if client.name == "rust_analyzer" then
          -- For rust, we do want to use the LSP formatting though as it's
          -- widley accepted.
          client.server_capabilities.documentFormattingProvider = true
        end

        if client.name == "tsserver" then
          -- For Typescript (javascript) we do use some extra tools built ontop
          -- of nvim-lsp to get us smarter code actions around imports, types etc.
          lsp_ts_utils.setup({
            auto_inlay_hints = false,
            always_organize_imports = false,
          })
          lsp_ts_utils.setup_client(client)
        end
      end

      if vim.fn.executable("vscode-json-language-server") then
        local schemastore_ok, schemastore = pcall(require, "schemastore")
        lspconfig.jsonls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            json = schemastore_ok and {
              schemas = schemastore.json.schemas(),
              validate = { enable = true },
            } or {},
          },
        })
      end

      if vim.fn.executable("vscode-css-language-server") then
        lspconfig.cssls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      if vim.fn.executable("clangd") then
        lspconfig.clangd.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      if vim.fn.executable("rust-analyzer") then
        lspconfig.rust_analyzer.setup({})
      end

      if vim.fn.executable("typescript") and vim.fn.executable("typescript-language-server") then
        lspconfig.tsserver.setup({
          capabilities = capabilities,
          init_options = lsp_ts_utils.init_options,
          on_attach = on_attach,
        })
      end

      if vim.fn.executable("tailwindcss-langauge-server") then
        lspconfig.tailwindcss.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          filetypes = {
            "css",
            "fsharp",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "markdown",
            "mdx",
            "ocaml",
            "postcss",
            "reason",
            "sass",
            "scss",
            "svelte",
            "typescript",
            "typescriptreact",
            "vue",
          },
          settings = {
            tailwindCSS = {
              classAttributes = { ".*class*", "_class", "a_class", "class", "className", "classList", "ngClass", ".*Classes*" },
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
              },
              validate = true,
            },
          },
        })
      end

      if vim.fn.executable("lua-language-server") then
        lspconfig.lua_ls.setup({ -- Lua
          on_attach = on_attach,
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        })
      end

      require("lspconfig").ocamllsp.setup({})

      -- if vim.fn.executable("dotnet") then
      --   require("lspconfig").fsautocomplete.setup({
      --     cmd = { "fsautocomplete", "--background-service-enabled" },
      --     filetypes = { "fsharp" },
      --     init_options = { AutomaticWorkspaceInit = true },
      --     capabilities = capabilities,
      --     on_attach = on_attach,
      --   })
      -- end
    end,
  },
}
