local M = {}

function M.init()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    require("telescope").setup {
        defaults = {
            color_devicons = false,
            winblend = 0,
            borderchars = {"", "", "", "", "", "", "", ""}, -- remove borders
            layout_config = {
                prompt_position = "bottom",
                height = 0.75
            },
            layout_strategy = "bottom_pane",
            mappings = {
                i = {
                    ["<esc>"] = actions.close
                }
            }
        }
    }
    telescope.load_extension "fzf"
end

function M.dotfiles()
    local opt = {
        cwd = "~/Code/OSS/dotfiles",
        prompt_title = "Dotfiles"
    }

    require("telescope.builtin").git_files(opt)
end

return M
