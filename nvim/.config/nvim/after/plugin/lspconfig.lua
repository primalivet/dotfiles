-- HINT: LspAttached is handled in vimrc (so that all keymaps live there)
-- HINT: See install commands at :help lspconfig-all

local capabilities = vim.lsp.protocol.make_client_capabilities()
require"lspconfig".clangd.setup{ capabilities = capabilities }
require"lspconfig".ts_ls.setup{ capabilities = capabilities }
require"lspconfig".prismals.setup{ capabilities = capabilities }
require"lspconfig".eslint.setup{ capabilities = capabilities }
require"lspconfig".cssls.setup{ capabilities = capabilities }
require"lspconfig".html.setup{ capabilities = capabilities }
require"lspconfig".jsonls.setup{ capabilities = capabilities }
