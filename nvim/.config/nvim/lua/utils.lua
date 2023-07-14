local M = {}

function M.is_dark_mode()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if handle == nil then
    return true
  end
  local result = handle:read("*a")
  handle:close()
  return result:match("^%s*Dark%s*$") ~= nil
end

return M
