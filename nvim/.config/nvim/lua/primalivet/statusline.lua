local M = {}

local colors = {
  yellow_bg = "%#StatusLineYellowBg#",
  green = "%#StatusLineGreen#",
  red = "%#StatusLineRed#",
  yellow = "%#StatusLineYellow#",
  blue = "%#StatusLineBlue#",
  cyan = "%#StatusLineCyan#",
  magenta = "%#StatusLineMagenta#",
  reset = "%#Statusline#",
}

local function git_status()
  local signs = vim.b.gitsigns_status_dict or { head = "", added = 0, changed = 0, removed = 0 }
  local has_branch = signs.head ~= ""

  return has_branch
      and string.format(
        "[%s][%s%s%s%s%s%s%s%s%s]",
        signs.head,
        colors.green,
        signs.added,
        colors.reset,
        colors.yellow,
        signs.changed,
        colors.reset,
        colors.red,
        signs.removed,
        colors.reset
      )
    or ""
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
    return string.format(
      "DIAG:[%s%s%s%s%s%s%s%s%s%s]",
      colors.red,
      errors,
      colors.reset,
      colors.yellow,
      warnings,
      colors.reset,
      colors.blue,
      infos,
      colors.reset,
      hints
    )
  end
end

local function lsp_status()
  local no_lsp_msg = "[none]"
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
    local lsp_names_msg = "LSP:[" .. table.concat(lsp_names, ",") .. "]"
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

local function get_mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local modes = {
    ["n"] = { "Normal", "N" },
    ["no"] = { "N·Pending", "N·P" },
    ["v"] = { "Visual", "V" },
    ["V"] = { "V·Line", "V·L" },
    [""] = { "V·Block", "V·B" },
    ["s"] = { "Select", "S" },
    ["S"] = { "S·Line", "S·L" },
    [""] = { "S·Block", "S·B" },
    ["i"] = { "Insert", "I" },
    ["ic"] = { "Insert", "I" },
    ["R"] = { "Replace", "R" },
    ["Rv"] = { "V·Replace", "V·R" },
    ["c"] = { "Command", "C" },
    ["cv"] = { "Vim·Ex ", "V·E" },
    ["ce"] = { "Ex ", "E" },
    ["r"] = { "Prompt ", "P" },
    ["rm"] = { "More ", "M" },
    ["r?"] = { "Confirm ", "C" },
    ["!"] = { "Shell ", "S" },
    ["t"] = { "Terminal ", "T" },
  }

  local mode = modes[current_mode]
  if mode then
    return mode
  else
    return { "Unknown", "U" }
  end
end

function M.print_status(which)
  local width = vim.api.nvim_win_get_width(0)
  -- approximate default statusline:
  -- %f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
  local filename = "%t"
  local filetype = "%y"
  local help = "%h"
  local preview = "%w"
  local modified = colors.yellow .. "%m" .. colors.reset
  local readonly = colors.red .. "%r" .. colors.reset
  local flags = help .. preview .. modified .. readonly
  local line = "%l"
  local column = "%c"
  local virtual_column = "%V"
  local percentage = "%P"
  local divider = "%="
  local git = if_else(width < 80, "", if_else(git_status() ~= "", "GIT:" .. git_status(), ""))

  if which == "inactive" then
    return string.format("%s %s %s %s:%s%s %s", filename, flags, divider, line, column, virtual_column, percentage)
  elseif which == "active" then
    local diagnostic = if_else(width < 80, "", diagnostics_status())
    -- HINT: Only use short name for now
    local mode = if_else(width < 120, get_mode()[2], get_mode()[2])
    local lsps = lsp_status()

    return string.format(
      "%s %s %s %s %s %s %s %s %s %s %s:%s%s %s",
      colors.yellow_bg, -- TODO: set color depending on mode?
      mode,
      colors.reset,
      filename,
      flags,
      git,
      diagnostic,
      lsps,
      divider,
      filetype,
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
  vim.cmd([[
        augroup Statusline
        au!
        au WinEnter,BufEnter * setlocal statusline=%!v:lua.MyStatusline.print_status('active')
        au WinLeave,BufLeave * setlocal statusline=%!v:lua.MyStatusline.print_status('inactive')
        augroup END
        ]])
end

return M
