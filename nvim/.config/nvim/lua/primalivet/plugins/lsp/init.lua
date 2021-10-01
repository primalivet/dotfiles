local hello = ""
local M = {}

function M.init()
    require("primalivet.plugins.lsp.sumneko").init()
    require("primalivet.plugins.lsp.vimls").init()
    require("primalivet.plugins.lsp.tsserver").init()
    require("primalivet.plugins.lsp.gopls").init()
    require("primalivet.plugins.lsp.null-ls").init()
    require("primalivet.plugins.lsp.jsonls").init()

    local function diag_type(severity)
        if severity == 1 then
            return "E"
        elseif severity == 2 then
            return "W"
        else
            return ""
        end
    end

    -- Integrate quickfix list with the nvim lsp
    do
        local lsp_method = "textDocument/publishDiagnostics"
        local default_handler = vim.lsp.handlers[lsp_method]
        vim.lsp.handlers[lsp_method] = function(err, method, result, client_id, bufnr, config)
            default_handler(err, method, result, client_id, bufnr, config)
            local diagnostics = vim.lsp.diagnostic.get_all()
            local qflist = {}
            for bnr, diag in pairs(diagnostics) do
                for _, d in ipairs(diag) do
                    d.bufnr = bnr
                    d.lnum = d.range.start.line + 1
                    d.col = d.range.start.character + 1
                    d.text = string.format("%s (%s)", d.message, d.source or "unknown")
                    d.type = diag_type(d.severity)
                    table.insert(qflist, d)
                end
            end
            vim.lsp.util.set_qflist(qflist)
        end
    end
end

return M
