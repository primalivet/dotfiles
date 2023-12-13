local codeium = {
  next_suggestion = function()
    return vim.fn['codeium#CycleCompletions'](1)
  end,
  prev_suggestion = function()
    return vim.fn['codeium#CycleCompletions'](-1)
  end,
  clear_suggestion = function()
    return vim.fn['codeium#Clear']()
  end,
  insert_suggestion = function()
    return vim.fn['codeium#Accept']()
  end,
  manual_trigger_suggestion = function()
    return vim.fn['codeium#Complete']()
  end,
}

return codeium
