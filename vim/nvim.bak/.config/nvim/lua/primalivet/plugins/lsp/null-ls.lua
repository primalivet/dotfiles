local M = {}

function M.init()
    local null_ls = require "null-ls"
    local helpers = require "null-ls.helpers"

    local source_luafmt = {
        method = null_ls.methods.FORMATTING,
        filetypes = {"lua"},
        name = "luafmt",
        generator = helpers.formatter_factory {
            command = "luafmt",
            args = {"--stdin"}, -- go with luafmt defaults, it does not support a per project config as for now.
            to_stdin = true
        }
    }

    local eslint_options = {
        condition = function(utils)
            return utils.root_has_file ".eslintrc" or utils.root_has_file(".eslintrc.json")
        end,
        command = "./node_modules/.bin/eslint"
    }

    local prettier_options = {
        condition = function(utils)
            return utils.root_has_file ".prettierrc" or utils.root_has_file ".prettierrc.json"
        end,
        command = "./node_modules/.bin/prettier"
    }

    local sources = {
        null_ls.builtins.formatting.eslint_d.with(eslint_options),
        null_ls.builtins.diagnostics.eslint_d.with(eslint_options),
        null_ls.builtins.formatting.prettier.with(prettier_options),
        source_luafmt
    }

    null_ls.config {
        sources = sources
    }

    require "lspconfig"["null-ls"].setup {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = true
            vim.cmd("command -buffer Formatting lua vim.lsp.buf.formatting()")
            vim.cmd("command -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")

            vim.cmd [[
                    augroup PRIMALIVET_FORMATTING
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                    augroup END
                    ]]
        end
    }
end

return M
