local M = {}

M.mode = "dark_default"

M.toggle_background = function()
    if M.mode == "dark_default" then
        M.init("light_default")
    else
        M.init("dark_default")
    end
end

M.init = function(mode)
    local theme = require("github-theme")
    M.mode = mode

    theme.setup(
        {
            hide_inactive_statusline = false,
            hide_end_of_buffer = false,
            theme_style = M.mode,
            function_style = "bold",
            dark_float = true,
            sidebars = {"qf", "packer"}
        }
    )

    vim.cmd("hi! link ImportCostVirtualText Comment")
    vim.cmd("hi! link StatusLine PmenuSel")
    vim.cmd("hi! link StatusLineNC CursorLine")
    vim.cmd("hi! link QuickfixLine CursorLine")
    vim.cmd("hi! link EndOfBuffer Whitespace")
end

return M
