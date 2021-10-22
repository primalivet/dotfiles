local M = {}

local function get_filename()
        local home = vim.env.HOME
        local filename = vim.fn.expand "%:p"

        if filename == "" then
                return ""
        end

        return filename:gsub(home, "~")
end

local function git_status()
        local signs = vim.b.gitsigns_status_dict or {head = "", added = 0, changed = 0, removed = 0}
        local has_branch = signs.head ~= ""

        return has_branch and string.format("%s +%s ~%s -%s", signs.head, signs.added, signs.changed, signs.removed) or ""
end

local function diagnostics_status()
        local diagnostics = vim.lsp.diagnostic.get_all()
        local items = vim.lsp.util.diagnostics_to_items(diagnostics)
        local es = 0
        local ws = 0
        local is = 0

        vim.cmd'hi! link StatusLineError Error'
        vim.cmd'hi! link StatusLineWarning Warning'

        for _, item in ipairs(items) do
                if item.type == 'E' then
                        es = es + 1
                elseif item.type == 'W' then
                        ws = ws + 1
                elseif item.type == 'I' then
                        is = is + 1
                end
        end

        if es == 0 and ws == 0 and is == 0 then
                return ""
        else
                return "%#StatusLineError#E:" .. es .. "%#StatusLineWarning#W:" .. ws .. "%#StatusLine#I:" .. is
                -- return string.format("%#StatusLineError#E:%s %#StatusLineWarning#W:%s I:%s", es, ws, is) or ""
        end
end

local function lsp_status()
        local no_lsp_msg = ""
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
end

M.print_status = function()
        local diagnostic = diagnostics_status()
        local git = git_status() ~= "" and git_status() .. "  " or ""
        local lsp = lsp_status() ~= "" and lsp_status() .. "  " or ""
        local fn = get_filename() ~= "" and get_filename() .. "  " or ""
        -- TODO turn into function and parse if empty
        local ft = "%y"
        local row_col = "%l:%c"
        local divider = "%="

        return string.format("  %s%s%s%s%s%s %s  ", git, fn, diagnostic, divider, lsp, ft, row_col)
end

MyStatusline = M

function M.init()
        vim.cmd(
        [[
        augroup Statusline
        au!
        au WinEnter,BufEnter * setlocal statusline=%!v:lua.MyStatusline.print_status()
        au WinLeave,BufLeave * setlocal statusline=%!v:lua.MyStatusline.print_status()
        au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.MyStatusline.print_status()
        augroup END
        ]]
        )
end

return M
