local M = {}

function M.init()
    local nvim_lsp = require "lspconfig"

    nvim_lsp.tsserver.setup {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            -- local ts_utils = require("nvim-lsp-ts-utils")
            -- local lsp_signature = require("lsp_signature")

            -- lsp_signature.on_attach(
            --     {
            --         bind = true,
            --         doc_lines = 10,
            --         hint_enable = false,
            --         handler_opts = {
            --             border = "none"
            --         }
            --     },
            --     bufnr
            -- )

            -- ts_utils.setup {
            --     filter_out_diagnostics_by_severity = {"hint"}
            -- }

            -- ts_utils.setup_client(client)
        end
    }
end

return M
