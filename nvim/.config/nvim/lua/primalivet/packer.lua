local M = {}

function M.init()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    -- Bootstrap (installs packer, requires restart after execution)
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  end

  local packer = require("packer")
  local use = packer.use
  packer.init()

  use("wbthomason/packer.nvim")
  use("editorconfig/editorconfig-vim")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-fugitive")
  use("tpope/vim-commentary")

  use({
    "junegunn/fzf",
    requires = { "junegunn/fzf.vim" },
    config = function()
      vim.g.fzf_layout = { down = "30%" }
      vim.g.fzf_preview_window = {}
      vim.g.fzf_action = { ["ctrl-x"] = "split", ["ctrl-v"] = "vsplit" }
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      local cmp = require("cmp")
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
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "±" },
        },
      })
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = { "nvim-treesitter/playground" },
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        playground = { enable = true },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    requires = { "hrsh7th/nvim-cmp", "jose-elias-alvarez/nvim-lsp-ts-utils", "simrat39/rust-tools.nvim" },
    config = function()
      local nvim_lsp = require("lspconfig")
      local rusttools = require("rust-tools")

      do
        -- Update loclist as diagnostics comes in
        local method_name = "textDocument/publishDiagnostics"
        local default_handler = vim.lsp.handlers[method_name]
        vim.lsp.handlers[method_name] = function(err, method, result, client_id, bufnr, config)
          default_handler(err, method, result, client_id, bufnr, config)
          vim.diagnostic.setloclist({ open = false })
        end
      end

      local function on_attach(client, _)
        -- Disable LSP formatting for any language server
        -- In most cases I tend to use null-ls for formatting and linting, as
        -- they are generally better to configure with widley used tools such
        -- as prettier and eslint.
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        if client.name == "rust_analyzer" then
          -- For rust, we do want to use the LSP formatting though as it's
          -- widley accepted.
          client.resolved_capabilities.document_formatting = true
          client.resolved_capabilities.document_range_formatting = true
        end

        if client.name == "tsserver" then
          -- For Typescript (javascript) we do use some extra tools built ontop
          -- of nvim-lsp to get us smarter code actions around imports, types etc.
          local ts_utils = require("nvim-lsp-ts-utils")
          ts_utils.setup({
            auto_inlay_hints = false,
            always_organize_imports = false,
            filter_out_diagnostics_by_severity = { "hint" },
          })
          ts_utils.setup_client(client)
        end
      end

      local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      nvim_lsp.elmls.setup({ capabilities = capabilities }) -- Elm

      nvim_lsp.cssls.setup({ capabilities = capabilities, on_attach = on_attach }) -- Css

      nvim_lsp.hls.setup({ capabilities = capabilities, on_attach = on_attach }) -- Haskell

      rusttools.setup({ server = { on_attach = on_attach } }) -- Rust

      nvim_lsp.tsserver.setup({ -- Typescript
        capabilities = capabilities,
        init_options = require("nvim-lsp-ts-utils").init_options,
        on_attach = on_attach,
      })

      nvim_lsp.sumneko_lua.setup({ -- Lua
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
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      local opts = {
        eslint_formatting = {
          condition = function(utils)
            local has_eslint = utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
            local has_prettier = utils.root_has_file({
              ".prettierrc",
              ".prettierrc.js",
              ".prettierrc.json",
            })

            return has_eslint and not has_prettier
          end,
        },
        eslint_diagnostics = {
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
          end,
        },
        prettier_formatting = {
          condition = function(utils)
            return utils.root_has_file({ ".prettierrc", ".prettierrc.js", ".prettierrc.json" })
          end,
        },
        stylua_formatting = {
          condition = function(utils)
            return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
          end,
        },
        elm_format_formatting = {
          condition = function(utils)
            return utils.root_has_file({ "elm.json" })
          end,
        },
      }

      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
          null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
          null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
          null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
          null_ls.builtins.formatting.elm_format.with(opts.elm_format_formatting),
        },
        on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
            vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
            vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
          end
        end,
      })
    end,
  })

  -- use({
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --     dap.set_log_level("TRACE")
  --     dap.adapters = {
  --       node2 = {
  --         type = "executable",
  --         command = "node",
  --         -- Download at: https://github.com/microsoft/vscode-node-debug2/tags
  --         args = { os.getenv("HOME") .. "/.local/bin/vscode-node-debug2/out/src/nodeDebug.js" },
  --       },
  --       -- chrome = {
  --       -- 	type = "executable",
  --       -- 	command = "node",
  --       -- 	Download at: https://github.com/microsoft/vscode-chrome-debug/releases
  --       -- 	args = { os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" },
  --       -- },
  --     }

  --     dap.configurations = {
  --       javascript = {
  --         {
  --           name = "Launch",
  --           type = "node2",
  --           request = "launch",
  --           program = "${file}",
  --           cwd = vim.fn.getcwd(),
  --           sourceMaps = true,
  --           protocol = "inspector",
  --           console = "integratedTerminal",
  --         },
  --         {
  --           -- For this to work you need to make sure the node process is started with the `--inspect` flag.
  --           name = "Attach to process",
  --           type = "node2",
  --           request = "attach",
  --           processId = require("dap.utils").pick_process,
  --         },
  --       },
  --       -- javascriptreact = {
  --       -- 	{
  --       -- 		type = "chrome",
  --       -- 		request = "attach",
  --       -- 		program = "${file}",
  --       -- 		cwd = vim.fn.getcwd(),
  --       -- 		sourceMaps = true,
  --       -- 		protocol = "inspector",
  --       -- 		port = 9222,
  --       -- 		webRoot = "${workspaceFolder}",
  --       -- 	},
  --       -- },
  --       -- typescriptreact = {
  --       -- 	{
  --       -- 		type = "chrome",
  --       -- 		request = "attach",
  --       -- 		program = "${file}",
  --       -- 		cwd = vim.fn.getcwd(),
  --       -- 		sourceMaps = true,
  --       -- 		protocol = "inspector",
  --       -- 		port = 9222,
  --       -- 		webRoot = "${workspaceFolder}",
  --       -- 	},
  --       -- },
  --     }
  --   end,
  -- })
end

return M
