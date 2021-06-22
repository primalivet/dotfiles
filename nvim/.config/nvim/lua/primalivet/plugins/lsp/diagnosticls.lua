local M = {}

function M.init()
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
      args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "%filename"}
    }
  }

  local formatFiletypes = {
    -- TODO make optional as I should be alble to control the formatter from an
    -- option depending on project
    -- With the right configuration this seem to work with both prettier and
    -- eslint as formatters as well as single prettier or eslint.
    --
    -- This is crutial to adopt to different projects. So options below could be
    -- javascript = { "eslint", "prettier" }
    -- javascript = "eslint"
    -- javascript = "prettier"
    javascript = {"eslint", "prettier"}
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
    end
  }
end

return M
