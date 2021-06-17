set completeopt=menuone,noselect " has to be this value for nvim-compe

lua << EOF
-- A guide that got me started by José Alvares
-- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
end

nvim_lsp.vimls.setup{}

nvim_lsp.tsserver.setup{
  on_attach = function(client)
	-- disable tsserver formatting to not conflict with prettier
	client.resolved_capabilities.document_formatting = false
	on_attach(client)
  end
}
EOF
