local M = {}

function M.init()
    local nvim_lsp = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    nvim_lsp.jsonls.setup(
        {
            capabilities = capabilities,
            on_attach = function(client)
                client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false
            end,
            settings = {
                json = {
                    schemas = {
                        {
                            description = "TypeScript compiler configuration file",
                            fileMatch = {"tsconfig.json", "tsconfig.*.json"},
                            url = "http://json.schemastore.org/tsconfig"
                        }
                    }
                }
            }
        }
    )
end

return M
