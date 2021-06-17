local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup{
  on_attach = function(client)
	-- disable tsserver formatting to not conflict with prettier
	-- TODO control this via global so it could be configured per project?
	client.resolved_capabilities.document_formatting = false
  end
}


