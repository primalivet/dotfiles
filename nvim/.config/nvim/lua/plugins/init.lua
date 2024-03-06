vim.g.codeium_manual = true

return {
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local default_opt = { noremap = true, silent = true }
      require('gitsigns').setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "±" },
          untracked = { text = "" },
        },
      })

      vim.keymap.set("n", "[h", require('gitsigns').prev_hunk, default_opt)
      vim.keymap.set("n", "]h", require('gitsigns').next_hunk, default_opt)

      vim.api.nvim_create_user_command("ResetHunk", "Gitsigns reset_hunk", {})
      vim.api.nvim_create_user_command("PreviewHunk", "Gitsigns preview_hunk", {})
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require('mini.extra').setup()
      require('mini.surround').setup()
      require('mini.comment').setup()
      require('mini.pick').setup({
        window = {
          config =
              function()
                local height = math.floor(0.5 * vim.o.lines)
                local row = math.floor(vim.o.lines - height)
                return { anchor = 'NW', width = vim.o.columns, height = height, row = row, col = 0 }
              end
        }
      })

      vim.keymap.set("n", "<leader>ss", ":Pick resume<CR>", { desc = "Search Same (as before)" })
      vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Search Files" })
      vim.keymap.set("n", "<leader>sb", ":Pick buffers<CR>", { desc = "Search Buffers" })
      vim.keymap.set("n", "<leader>sh", ":Pick help<CR>", { desc = "Search Help" })
      vim.keymap.set("n", "<leader>sl", ":Pick grep_live<CR>", { desc = "Search Live" })
      vim.keymap.set("n", "<leader>sc", ":Pick git_commits<CR>", { desc = "Search Commits" })
      vim.keymap.set("n", "<leader>sr", ":Pick lsp scope='references'<CR>", { desc = "Search References" })
      vim.keymap.set("n", "<leader>sws", ":Pick lsp scope='workspace_symbol'<CR>", { desc = "Search Workspace Symbol" })
      vim.keymap.set("n", "<leader>sds", ":Pick lsp scope='document_symbol'<CR>", { desc = "Search Document Symbol" })

      require('mini.completion').setup({
        lsp_completion = {
          source_func = 'omnifunc',
          auto_setup = false,
        }
      })

    end
  },
  {
    "Exafunction/codeium.vim",
    config = function()
      vim.api.nvim_create_autocmd({ "BufRead", "DirChanged" }, {
        group = vim.api.nvim_create_augroup("PrimalivetCodeium", { clear = true }),
        pattern = "*",
        callback = function()
          -- local codeium = {
          --   next_suggestion = function()
          --     return vim.fn["codeium#CycleCompletions"](1)
          --   end,
          --   prev_suggestion = function()
          --     return vim.fn["codeium#CycleCompletions"](-1)
          --   end,
          --   clear_suggestion = function()
          --     return vim.fn["codeium#Clear"]()
          --   end,
          --   insert_suggestion = function()
          --     return vim.fn["codeium#Accept"]()
          --   end,
          --   manual_trigger_suggestion = function()
          --     return vim.fn["codeium#Complete"]()
          --   end,
          -- }

          if not string.match(vim.fn.getcwd(), "/Code/OSS") then
            vim.cmd("CodeiumDisable")
          end
        end,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'WhoIsSethDaniel/mason-tool-installer.nvim'
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          vim.bo[event.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
          local default_opt = { buffer = event.buf, noremap = true, silent = true }
          -- Edit
          vim.keymap.set("n", "<leader>ea", vim.lsp.buf.code_action, default_opt)
          vim.keymap.set("n", "<leader>ef", function() vim.lsp.buf.format({ async = true }) end, default_opt)
          vim.keymap.set("n", "<leader>er", vim.lsp.buf.rename, default_opt)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, default_opt)
          vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, default_opt)
          vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, default_opt)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, default_opt)
          vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, default_opt)
          vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, default_opt)
        end
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local servers = {
        clangd = {},
        tsserver = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = { '${3rd}/luv/library', unpack(vim.api.nvim_get_runtime_file('', true)) },
              },
              completion = { callSnippet = 'Replace' },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {})
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end
  },
  {
    "nvimtools/none-ls.nvim",
    commit = "bb680d752cec37949faca7a1f509e2fe67ab418a",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require('null-ls')
      local root_has_file = function(file)
        return function(utils)
          local has_file = utils.root_has_file(file)
          return has_file
        end
      end

      local eslint_root_files = { ".eslintrc", ".eslintrc.cjs", ".eslintrc.js", ".eslintrc.json" }
      local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
      local stylua_root_files = { "stylua.toml", ".stylua.toml" }
      local ocamlformat_root_files = { "ocamlformat", ".ocamlformat" }
      local clang_format_root_files = { ".clang-format" }

      local json_file_has_field = function(filename, fieldname)
        return function(utils)
          if not utils.root_has_file(filename) then return false end
          local contents = vim.fn.readfile(vim.fn.getcwd() .. "/" .. filename)
          return vim.fn.json_decode(contents)[fieldname] ~= nil
        end
      end

      local opts = {
        eslint_formatting = {
          condition = function(utils)
            local has_eslint = root_has_file(eslint_root_files)(utils)
            local has_prettier = root_has_file(prettier_root_files)(utils)
            local has_package_json_eslint = json_file_has_field("package.json", "eslintConfig")(utils)
            local has_package_json_prettier = json_file_has_field("package.json", "prettier")(utils)
            local has_package_json_config = has_package_json_eslint and not has_package_json_prettier
            return (has_eslint and not has_prettier) or (has_package_json_config)
          end,
        },
        eslint_diagnostics = {
          condition = root_has_file(eslint_root_files),
        },
        prettier_formatting = {
          condition = function(utils)
            local has_package_json_prettier = json_file_has_field("package.json", "prettier")(utils)
            return root_has_file(prettier_root_files)(utils) or has_package_json_prettier
          end,
        },
        stylua_formatting = {
          condition = root_has_file(stylua_root_files),
        },
        ocamlformat_formatting = {
          condition = root_has_file(ocamlformat_root_files),
        },
        clang_format_formatting = {
          condition = root_has_file(clang_format_root_files),
        },
      }

      local function on_attach(client, _)
        if client.server_capabilities.document_formatting then
          vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
          vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
        end
      end

      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint.with(opts.eslint_diagnostics),
          null_ls.builtins.formatting.eslint.with(opts.eslint_formatting),
          null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
          null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
          null_ls.builtins.formatting.ocamlformat.with(opts.ocamlformat_formatting),
          null_ls.builtins.formatting.clang_format.with(opts.clang_format_formatting),
          null_ls.builtins.code_actions.eslint.with(opts.eslint_diagnostics),
        },
        on_attach = on_attach,
      })
    end
  },
}
