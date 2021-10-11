local M = {}

function M.init()
    local nvim_lsp = require("lspconfig")
    -- Capabilities are not resolved in on_attach as that is the servers
    -- capabilities, here we need to set neovims capabilities.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local function on_attach(client)
        -- However, since I use null-ls for formatting we can remove the
        -- languages server capabilities to format here
        -- I know is a bit weird of an api since it's called "client"
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    local jsonls_settings = {
        json = {
            schemas = {
                {
                    description = "TypeScript compiler configuration file",
                    fileMatch = {"tsconfig.json", "tsconfig.*.json"},
                    url = "http://json.schemastore.org/tsconfig"
                },
                {
                    description = "ESLint config",
                    fileMatch = {".eslintrc.json", ".eslintrc"},
                    url = "http://json.schemastore.org/eslintrc"
                },
                {
                    description = "Prettier config",
                    fileMatch = {".prettierrc", ".prettierrc.json", "prettier.config.json"},
                    url = "http://json.schemastore.org/prettierrc"
                }
            }
        }
    }

    nvim_lsp.jsonls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = jsonls_settings
    }

    local yamlls_settings = {
        yaml = {
            schemas = {
                {
                    description = "Docker Compose config",
                    fileMatch = {"docker-compose.yml", "docker-compose.yaml"},
                    url = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"
                }
            }
        }
    }

    nvim_lsp.yamlls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = yamlls_settings
    }
end

return M
