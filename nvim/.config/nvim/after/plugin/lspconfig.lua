-- HINT: LspAttached is handled in vimrc (so that all keymaps live there)
-- HINT: See install commands at :help lspconfig-all

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "double"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
require"lspconfig".clangd.setup{ capabilities = capabilities }
require"lspconfig".ts_ls.setup{ capabilities = capabilities }
require"lspconfig".prismals.setup{ capabilities = capabilities }
require"lspconfig".eslint.setup{ capabilities = capabilities }
require"lspconfig".cssls.setup{ capabilities = capabilities }
require"lspconfig".html.setup{ capabilities = capabilities }
require"lspconfig".jsonls.setup{ capabilities = capabilities }
require"lspconfig".gopls.setup{ capabilities = capabilities }
