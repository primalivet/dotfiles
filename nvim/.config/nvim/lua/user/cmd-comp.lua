local cmd_comp_augroup = vim.api.nvim_create_augroup("CMD_COMP_GROUP", {})

local comp_buf = nil
local comp_win = nil

vim.api.nvim_create_autocmd({"CmdlineEnter" }, {
  group = cmd_comp_augroup,
  callback = function()
    -- create buffer
    local comp_buf_scratch = true
    local comp_buf_listed = false
    comp_buf = vim.api.nvim_create_buf(comp_buf_listed, comp_buf_scratch)
    print("Created completion buffer", comp_buf)
    -- create window
    local comp_win_enter = false
    local comp_win_config = {
      win = 0,
      split = "below",
    }
    comp_win = vim.api.nvim_open_win(comp_buf, comp_win_enter, comp_win_config)
    print("Created completion window", comp_win)
    -- populate initial buffer lines
  end
})

vim.api.nvim_create_autocmd({"CmdlineLeave" }, {
  group = cmd_comp_augroup,
  callback = function()
    if comp_win ~= nil then
      vim.api.nvim_win_close(comp_win, true)
      print("Closed completion window", comp_win)
      comp_win = nil
    end
  end
})

vim.api.nvim_create_autocmd({"CmdlineChanged"}, {
  group = cmd_comp_augroup,
  callback = function()
    print("Updating suggestions")
    -- TODO: Throttle updating completions?
    -- local comp_input = vim.fn.getcmdline()
    -- local comp_respect_wildignore = 1
    -- local comp_suggestions = vim.fn.getcompletion(comp_input, "cmdline", comp_respect_wildignore)
    -- print("Current command input", comp_input)
    -- print("Current command suggestions", vim.inspect(comp_suggestions))
    -- if comp_buf ~= nil and comp_win ~= nil then
    --   vim.api.nvim_buf_set_lines(comp_buf, 0, -1, false, {"hello world"})
    --   print("Current command suggestions updated")
    -- end

  end
})
