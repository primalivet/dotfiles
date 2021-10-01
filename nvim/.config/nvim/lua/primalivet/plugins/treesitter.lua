local M = {}

function M.init()
    require "nvim-treesitter.configs".setup {
        ensure_installed = {
            "bash",
            -- 'css',
            "dockerfile",
            "go",
            "gomod",
            "graphql",
            "html",
            "javascript",
            "json",
            "lua",
            "scss",
            "tsx",
            "typescript",
            "vue",
            "yaml"
        },
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        },
        autopairs = {enable = true}, -- require autopairs plug
        autotag = {enable = true} -- require autotag plug
    }
end

return M
