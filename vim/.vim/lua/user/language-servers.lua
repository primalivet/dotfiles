-- HINT: LspAttached is handled in vimrc

-- Define client capabilities to tell the lsp server what we can do
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- HINT: Install `clangd` with Xcode (on Darwin)
require("lspconfig").clangd.setup({ capabilities = capabilities })
-- HINT: Install `ts_ls` with `npm install -g typescript typescript-language-server`
require("lspconfig").ts_ls.setup({ capabilities = capabilities })
-- HINT: Install `prismals` with `npm install -g @prisma/language-server`
require("lspconfig").prismals.setup({ capabilities = capabilities })
-- HINT: Install `eslint`, `cssls`, `html` and `jsonls` with `npm i -g vscode-langservers-extracted`
require("lspconfig").eslint.setup({ capabilities = capabilities })
require("lspconfig").cssls.setup({ capabilities = capabilities })
require("lspconfig").html.setup({ capabilities = capabilities })
require("lspconfig").jsonls.setup({ capabilities = capabilities })

local function lsp_format_filter(client)
  print(client.name)
  --return client.name ~= "ts_ls"
end
