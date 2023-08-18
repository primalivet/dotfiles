return {
  {
    "folke/trouble.nvim",
    opts = {
      -- settings without a patched font or icons
      icons = false,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        error = "E",
        warning = "W",
        hint = "H",
        information = "I",
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      local root_has_file = function(files)
        return function(utils)
          return utils.root_has_file(files)
        end
      end

      local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
      local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
      local stylua_root_files = { "stylua.toml", ".stylua.toml" }
      local ocamlformat_root_files = { "ocamlformat", ".ocamlformat" }
      local clang_format_root_files = { ".clang-format" }

      local opts = {
        eslint_formatting = {
          condition = function(utils)
            local has_eslint = root_has_file(eslint_root_files)(utils)
            local has_prettier = root_has_file(prettier_root_files)(utils)
            return has_eslint and not has_prettier
          end,
        },
        eslint_diagnostics = {
          condition = root_has_file(eslint_root_files),
        },
        prettier_formatting = {
          condition = root_has_file(prettier_root_files),
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
          null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
          null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
          null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
          null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
          null_ls.builtins.formatting.ocamlformat.with(opts.ocamlformat_formatting),
          null_ls.builtins.formatting.clang_format.with(opts.clang_format_formatting),
          null_ls.builtins.code_actions.eslint_d.with(opts.eslint_diagnostics),
          null_ls.builtins.code_actions.gitsigns,
        },
        on_attach = on_attach,
      })
    end,
  },
}
