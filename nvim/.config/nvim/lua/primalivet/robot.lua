local OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
local function build_cmd(message, open_api_key)
  local body = {
    model = "gpt-3.5-turbo",
    messages = { { role = "user", content = message } },
    temperature = 0.7,
    stream = true,
  }

  local url = "https://api.openai.com/v1/chat/completions"
  local command = {
    "curl",
    "--no-buffer",
    "--no-progress-meter",
    "-H",
    "Authorization: Bearer " .. open_api_key,
    "-H",
    "Content-Type: application/json",
    "-d",
    vim.fn.json_encode(body),
    url,
  }
  return command
end

local function remove_data_prefix(str)
  -- Replace "data: " at the start of the string with nothing
  local result = string.gsub(str, "^data: ", "")
  return result
end

local append_line = nil
local append_col = 0

local function on_event_output(job_id, data, _)
  if data then
    if not append_line then
      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      append_line = cursor_pos[1] + 1
      vim.api.nvim_buf_set_lines(0, append_line - 1, append_line - 1, false, { "" })
    end

    local cleaned = vim.tbl_map(remove_data_prefix, data)
    for _, line in ipairs(cleaned) do
      if line == "[DONE]" then
        break
      end
      if line ~= "" then
        -- print(vim.inspect(line))
        local ok, decoded = pcall(vim.json.decode, line, { luanil = { object = true, array = true } })
        -- print(vim.inspect(decoded))

        local is_table = ok and type(decoded) == "table"
        if ok and is_table then
          local choices = vim.tbl_get(decoded, "choices")
          local fst_choice = choices[1]
          local finish_reason = vim.tbl_get(fst_choice, "finish_reason")

          if finish_reason == "stop" then
            vim.fn.jobstop(job_id)
            break
          end
          local content = vim.tbl_get(fst_choice, "delta", "content")
          if content:find("\n\n") then
            -- TODO: split on newline chars into parts, but keep newlines positions somehow
            -- TODO: emit each part with a newline inbetween each part
            -- Example: hello\n\nworld should emit(hello) emit(newline) emit(world)
            -- Example: \n\n should emit(newline)
            -- Example: \n\nworld should emit(newline) emit(world)
            -- Example: \n\nworld\n\n should emit(newline) emit(world) emit(newline)
            -- Example: \n\n\n\n should emit(newline) emit(newline)
            local parts = {}
            for text, newlines in string.gmatch(content, "(.-)(\n*)") do
              if text ~= "" then
                table.insert(parts, text)
              end
              if newlines ~= "" then
                for i = 1, #newlines do
                  table.insert(parts, "\n")
                end
              end
            end
          end

          -- if content:find("\n\n") then
          --   vim.api.nvim_buf_set_lines(0, append_line - 1, append_line - 1, false, { "" })
          --   append_line = append_line + 1
          --   append_col = 0
          -- elseif content then
          --   vim.api.nvim_buf_set_text(0, append_line - 1, append_col, append_line - 1, append_col, { content })
          --   append_col = append_col + #content
          -- end
        end
      end
    end
  end
end

local function on_event_error(_, data, _)
  for _, message in ipairs(data) do
    print(message)
  end
end

local function stream_openai_with_curl(opts)
  local message = opts.args or "Tell me a joke"
  local cmd = build_cmd(message, OPENAI_API_KEY)

  vim.fn.jobstart(cmd, {
    on_stdout = on_event_output,
    on_stderr = on_event_error,
    stdout_buffered = false,
    stderr_buffered = true,
  })
end

vim.api.nvim_create_user_command("Stream", stream_openai_with_curl, {
  nargs = "*", -- Accepts any number of arguments
  -- complete = function(ArgLead, CmdLine, CursorPos)
  --   return {'suggestion1', 'suggestion2'} -- Example static completion
  -- end,
  -- desc = "Stream text from OpenAI",
})

-- TESTING

local function testing()
  local function processAndEmitWithTracking(input, emit)
    local currentLine, currentColumn = 1, 0 -- Initialize line and column counters
    local parts = {}

    for text, newlines in string.gmatch(input, "(.-)(\n*)") do
      if text ~= "" then
        table.insert(parts, text)
      end
      if newlines ~= "" then
        for i = 1, #newlines do
          table.insert(parts, "\n")
        end
      end
    end

    for _, part in ipairs(parts) do
      if part == "\n" then
        -- Emit an empty line only if the next part is also a newline
        if parts[_ + 1] == "\n" then
          emit(currentLine, currentColumn, "empty line")
          currentLine = currentLine + 2 -- Skip the next line as it's already handled
          currentColumn = 0
          _ = _ + 1 -- Skip the next part as it's already handled
        else
          currentLine = currentLine + 1
          currentColumn = 0
        end
      else
        emit(currentLine, currentColumn, part)
        currentColumn = currentColumn + #part -- Update the column based on part length
      end
    end
  end

  -- Example usage with tracking
  local function myEmitFunctionWithTracking(line, column, part)
    if part == "empty line" then
      print(string.format("[%d:%d] [Empty Line]", line, column))
    else
      print(string.format("[%d:%d] %s", line, column, part))
    end
  end

  processAndEmitWithTracking("hello\n\nworld", myEmitFunctionWithTracking)
  print("-----")
  processAndEmitWithTracking("\n\n", myEmitFunctionWithTracking)
  print("-----")
  processAndEmitWithTracking("\n\nworld", myEmitFunctionWithTracking)
  print("-----")
  processAndEmitWithTracking("\n\nworld\n\n", myEmitFunctionWithTracking)
  print("-----")
  processAndEmitWithTracking("\n\n\n\n", myEmitFunctionWithTracking)
end
