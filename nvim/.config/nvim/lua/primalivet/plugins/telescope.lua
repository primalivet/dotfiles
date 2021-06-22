local M = {}

function M.init()
  local actions = require('telescope.actions')

  require('telescope').setup{
    defaults = {
      color_devicons = false,
      winblend = 10,
      mappings = {
        i = {
          ["<esc>"] = actions.close
        },
      },
    }
  }
end

function M.dotfiles()
  require('telescope.builtin').git_files {
    cwd = '/mnt/c/Code/dotfiles',
    prompt_title = 'Dotfiles'
  }
end

return M
