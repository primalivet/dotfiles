
function init()
  local actions = require('telescope.actions')

  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close
        },
      },
    }
  }
end

return {
  init = init
}
