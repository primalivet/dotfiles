local M = {}

function M.init()
    local actions = require("telescope.actions")
    require("telescope").setup {
        defaults = {
            color_devicons = false,
            winblend = 0,
            borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
            layout_config = {
                width = 0.8,
                height = 0.8
            },
            previewer = false,
            mappings = {
                i = {
                    ["<esc>"] = actions.close
                }
            }
        }
    }
end

function M.dotfiles()
    local opt = {
        cwd = "~/Code/OSS/dotfiles",
        prompt_title = "Dotfiles"
    }

    require("telescope.builtin").git_files(opt)
end

return M
