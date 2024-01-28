local gen_ok, gen = pcall(require, "gen")

if not gen_ok then
  print("Gen not found")
end

-- gen.setup({
--   model = "mistral", -- The default model to use.
--   display_mode = "split", -- The display mode. Can be "float" or "split".
--   show_prompt = false, -- Shows the Prompt submitted to Ollama.
--   show_model = true, -- Displays which model you are using at the beginning of your chat session.
--   no_auto_close = false, -- Never closes the window automatically.
--   init = function(options)
--     pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
--   end,
--   -- Function to initialize Ollama
--   command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
--   -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
--   -- This can also be a lua function returning a command string, with options as the input parameter.
--   -- The executed command must return a JSON object with { response, context }
--   -- (context property is optional).
--   list_models = "<omitted lua function>", -- Retrieves a list of model names
--   debug = false, -- Prints errors and the command which is run.
-- })

local codeium = {
  next_suggestion = function()
    return vim.fn["codeium#CycleCompletions"](1)
  end,
  prev_suggestion = function()
    return vim.fn["codeium#CycleCompletions"](-1)
  end,
  clear_suggestion = function()
    return vim.fn["codeium#Clear"]()
  end,
  insert_suggestion = function()
    return vim.fn["codeium#Accept"]()
  end,
  manual_trigger_suggestion = function()
    return vim.fn["codeium#Complete"]()
  end,
}

return codeium
