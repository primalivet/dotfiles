-- local dap = require("dap")
-- dap.set_log_level("TRACE")
-- dap.adapters = {
--   node2 = {
--     type = "executable",
--     command = "node",
--     -- Download at: https://github.com/microsoft/vscode-node-debug2/tags
--     args = { os.getenv("HOME") .. "/.local/bin/vscode-node-debug2/out/src/nodeDebug.js" },
--   },
--   chrome = {
--     type = "executable",
--     command = "node",
--     -- Download at: https://github.com/microsoft/vscode-chrome-debug/releases
--     args = { os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" },
--   },
-- }

-- dap.configurations = {
--   javascript = {
--     {
--       name = "Launch",
--       type = "node2",
--       request = "launch",
--       program = "${file}",
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = "inspector",
--       console = "integratedTerminal",
--     },
--     {
--       -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--       name = "Attach to process",
--       type = "node2",
--       request = "attach",
--       processId = require("dap.utils").pick_process,
--     },
--   },
--   javascriptreact = {
--     {
--       type = "chrome",
--       request = "attach",
--       program = "${file}",
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = "inspector",
--       port = 9222,
--       webRoot = "${workspaceFolder}",
--     },
--   },
--   typescriptreact = {
--     {
--       type = "chrome",
--       request = "attach",
--       program = "${file}",
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = "inspector",
--       port = 9222,
--       webRoot = "${workspaceFolder}",
--     },
--   },
-- }
