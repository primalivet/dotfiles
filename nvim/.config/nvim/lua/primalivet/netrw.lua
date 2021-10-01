local M = {}

function M.init()
    vim.g["netrw_banner"] = 0
    vim.g["netrw_browse_splits"] = 4
    vim.g["netrw_liststyle"] = 3
end

return M
