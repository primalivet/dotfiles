local M = {}

function M.init()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'css',
      'dockerfile',
      'html',
      'javascript',
      'json',
      'lua',
      'tsx',
      'typescript',
      'yaml',
    },
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    }
  })
end

return M
