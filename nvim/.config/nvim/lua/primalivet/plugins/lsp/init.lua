local M = {}

function M.init()
    require("primalivet.plugins.lsp.sumneko").init()
    require("primalivet.plugins.lsp.vimls").init()
    require("primalivet.plugins.lsp.tsserver").init()
    require("primalivet.plugins.lsp.gopls").init()
    require("primalivet.plugins.lsp.null-ls").init()
    require("primalivet.plugins.lsp.jsonls").init()

    -- Integrate quickfix list with the nvim lsp
    do
        local lsp_method = "textDocument/publishDiagnostics"
        local default_handler = vim.lsp.handlers[lsp_method]
        vim.lsp.handlers[lsp_method] = function(err, method, result, client_id, bufnr, config)
            default_handler(err, method, result, client_id, bufnr, config)
            local diagnostics = vim.lsp.diagnostic.get_all()
            local items = vim.lsp.util.diagnostics_to_items(diagnostics)

            vim.lsp.util.set_loclist(items)
        end
    end
end

return M
