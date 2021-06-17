local nvim_lsp = require"lspconfig"

local linters = {
  eslint = {
	sourceName = "eslint",
	command = "eslint_d",
	rootPatterns = {".eslintrc", ".eslintrc.json"},
	debounce = 100,
	args = { "--stdin", "--stdin-filename", "%filename", "--format", "json"},
	parseJson = {
	  errorsRoot = "[0].messages",
	  line = "line",
	  column = "column",
	  endLine = "endLine",
	  endColumn = "endColumn",
	  message = "${message} [${ruleId}]",
	  security = "severity"
	},
	securities = {[2] = "error", [1] = "warning"}
  }
}

local filetypes = { javascript = "eslint" }

local formatters = {
  prettier = {
	command = "./node_modules/.bin/prettier",
	args = {"--stdin-filepath", "%filepath"}
  },
  eslint = {
	command = "eslint_d",
	args = { "--fix", "--stdin-filepath", "%filepath"}
  }
}

local formatFiletypes = {
  javascript = "prettier"
}

nvim_lsp.diagnosticls.setup{
  filetypes = { "javascript" },
  init_options = {
	linters = linters,
	filetypes = filetypes,
	formatters = formatters,
	formatFiletypes = formatFiletypes
  },
  on_attach = function(client)
	client.resolved_capabilities.formatting = true
	-- client.resolved_capabilities.rename = false
	-- client.resolved_capabilities.goto_definition = false
  end
}
