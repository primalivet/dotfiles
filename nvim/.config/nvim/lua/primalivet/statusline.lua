local M = {}

local function get_filename()
    local filename = vim.fn.expand "%:p"
    local cwd = vim.fn.getcwd()

    if filename == "" then
        return ""
    end

    return filename:gsub(cwd, "")
end

local function git_status()
    local signs = vim.b.gitsigns_status_dict or {head = "", added = 0, changed = 0, removed = 0}
    local has_branch = signs.head ~= ""

    return has_branch and string.format("%s +%s ~%s -%s", signs.head, signs.added, signs.changed, signs.removed) or ""
end

local function diagnostics_status()
    local diagnostics = vim.diagnostic.get(0)
    local items = vim.diagnostic.toqflist(diagnostics)
    local errors = 0
    local warnings = 0
    local infos = 0
    local hints = 0

    for _, item in ipairs(items) do
        if item.type == "E" then
            errors = errors + 1
        elseif item.type == "W" then
            warnings = warnings + 1
        elseif item.type == "I" then
            infos = infos + 1
        elseif item.type == "N" then
            hints = hints + 1
        end
    end

    if errors == 0 and warnings == 0 and infos == 0 and hints == 0 then
        return ""
    else
        return string.format("[E:%s W:%s I:%s H:%s]", errors, warnings, infos, hints)
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

local function if_else(pred, trueVal, falseVal)
    if pred then
        return trueVal
    else
        return falseVal
    end
end

M.print_status = function(which)
    local width = vim.api.nvim_win_get_width(0)
    -- approximate default statusline:
    -- %f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
    local filename = if_else(width < 100, "%t", "%f")
    local help = "%h"
    local preview = "%w"
    local modified = "%m"
    local readonly = "%r"
    local flags = help .. preview .. modified .. readonly
    local line = "%l"
    local column = "%c"
    local virtual_column = "%V"
    local percentage = "%P"
    local divider = "%="
    local git = if_else(width < 80, "", if_else(git_status() ~= "", "[" .. git_status() .. "]", ""))

    if which == "inactive" then
        return string.format("%s %s %s %s:%s%s %s", filename, flags, divider, line, column, virtual_column, percentage)
    elseif which == "active" then
        local diagnostic = if_else(width < 60, "", diagnostics_status())

        return string.format(
            "%s %s %s %s %s %s:%s%s %s",
            filename,
            flags,
            divider,
            git,
            diagnostic,
            line,
            column,
            virtual_column,
            percentage
        )
    else
        return ""
    end
end

_G.MyStatusline = M

function M.init()
    vim.cmd(
        [[
        augroup Statusline
        au!
        au WinEnter,BufEnter * setlocal statusline=%!v:lua.MyStatusline.print_status('active')
        au WinLeave,BufLeave * setlocal statusline=%!v:lua.MyStatusline.print_status('inactive')
        augroup END
        ]]
    )
end

return M
