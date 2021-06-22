local M = {}

function M.init()
  require("primalivet.plugins.lsp.sumneko").init()
  require("primalivet.plugins.lsp.vimls").init()
  require("primalivet.plugins.lsp.tsserver").init()
  require("primalivet.plugins.lsp.gopls").init()
  require("primalivet.plugins.lsp.diagnosticls").init()
end

return M
