local M = {}

function M.init()
    local nvim_lsp = require "lspconfig"
    nvim_lsp.gopls.setup {
        cmd = {"gopls", "serve"},
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true
                },
                staticcheck = true
            }
        }
    }
end

return M
