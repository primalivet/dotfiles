local M = {}

M.init = function()
    local conditions = {
        only_on_wide = function()
            return vim.fn.winwidth(0) > 80
        end
    }

    local diagnostics_section = {
        "diagnostics",
        sources = {"nvim_lsp"},
        sections = {"error", "warn", "info", "hint"},
        symbols = {error = " ", warn = " ", hint = " ", info = " "}
    }

    local active_lsp_section = {
        function()
            local no_lsp_msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            local lsp_names = {}

            if next(clients) == nil then
                return no_lsp_msg
            end -- no lsp clients connected

            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then -- client supports current filetype
                    table.insert(lsp_names, client.name)
                end
            end

            if not next(lsp_names) then -- table is empty
                return no_lsp_msg
            else
                local lsp_names_msg = table.concat(lsp_names, ", ")
                return lsp_names_msg
            end
        end,
        icon = " ",
        condition = conditions.only_on_wide
    }

    require("lualine").setup(
        {
            options = {
                icons_enabled = true,
                theme = "github",
                component_separators = {"|", "|"},
                section_separators = {"", ""},
                disabled_filetypes = {}
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch"},
                lualine_c = {"filename", diagnostics_section},
                lualine_x = {
                    active_lsp_section,
                    {"encoding", condition = conditions.only_on_wide},
                    {"fileformat", condition = conditions.only_on_wide},
                    {"filetype", condition = conditions.only_on_wide}
                },
                lualine_y = {"progress"},
                lualine_z = {"location"}
            },
            inactive_sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch"},
                lualine_c = {"filename"},
                lualine_x = {
                    {"encoding", condition = conditions.only_on_wide},
                    {"fileformat", condition = conditions.only_on_wide},
                    {"filetype", condition = conditions.only_on_wide}
                },
                lualine_y = {"progress"},
                lualine_z = {"location"}
            },
            tabline = {},
            extensions = {}
        }
    )
end

return M
