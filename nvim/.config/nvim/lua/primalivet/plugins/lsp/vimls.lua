local M = {}

function M.init()
    local nvim_lsp = require("lspconfig")
    nvim_lsp.vimls.setup {}
end

return M
