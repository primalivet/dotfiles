local M = {}

function M.init()
    require("trouble").setup(
        {
            auto_open = false,
            auto_close = false
        }
    )
end

return M
