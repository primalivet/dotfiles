local M = {}

function M.init()
    require("nvim-autopairs").setup(
        {
            check_ts = true, -- use autopairs with treesitter
            ts_config = {
                javascript = {"templatestring"} -- no autopairs for js templatestring
            }
        }
    )
end

return M
