-- Remove float borders
vim.g.lsp_zero_ui_float_border = 0
vim.g.codeium_manual = true

return {
  -- Misc
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim", opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "±" },
        untracked = { text = "" },
      },
    }
  },
  "nvim-lua/plenary.nvim",
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end },
  {
    "junegunn/fzf", dependencies = "junegunn/fzf.vim", config = function()
      vim.g.fzf_layout = { down = "50%" }
      vim.g.fzf_preview_window = {}
    end
  },
  { "echasnovski/mini.nvim", version = "*", config = function()
    require('mini.surround').setup()
    require('mini.comment').setup()
  end },
  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    config = false,
    dependencies = {
      "b0o/schemastore.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Completion (and snippets)
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      -- Sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
  },
  { "nvimtools/none-ls.nvim", commit = "bb680d752cec37949faca7a1f509e2fe67ab418a", config = function()
    local null_ls = require('null-ls')
    local root_has_file = function(file)
      return function(utils)
        local has_file = utils.root_has_file(file)
        return has_file
      end
    end

    local eslint_root_files = { ".eslintrc", ".eslintrc.cjs", ".eslintrc.js", ".eslintrc.json" }
    local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
    local stylua_root_files = { "stylua.toml", ".stylua.toml" }
    local ocamlformat_root_files = { "ocamlformat", ".ocamlformat" }
    local clang_format_root_files = { ".clang-format" }

    local json_file_has_field = function(filename, fieldname)
      return function(utils)
        if not utils.root_has_file(filename) then return false end
        local contents = vim.fn.readfile(vim.fn.getcwd() .. "/" .. filename)
        return vim.fn.json_decode(contents)[fieldname] ~= nil
      end
    end

    local opts = {
      eslint_formatting = {
        condition = function(utils)
          local has_eslint = root_has_file(eslint_root_files)(utils)
          local has_prettier = root_has_file(prettier_root_files)(utils)
          local has_package_json_eslint = json_file_has_field("package.json", "eslintConfig")(utils)
          local has_package_json_prettier = json_file_has_field("package.json", "prettier")(utils)
          local has_package_json_config = has_package_json_eslint and not has_package_json_prettier
          return (has_eslint and not has_prettier) or (has_package_json_config)
        end,
      },
      eslint_diagnostics = {
        condition = root_has_file(eslint_root_files),
      },
      prettier_formatting = {
        condition = function(utils)
          local has_package_json_prettier = json_file_has_field("package.json", "prettier")(utils)
          return root_has_file(prettier_root_files)(utils) or has_package_json_prettier
        end,
      },
      stylua_formatting = {
        condition = root_has_file(stylua_root_files),
      },
      ocamlformat_formatting = {
        condition = root_has_file(ocamlformat_root_files),
      },
      clang_format_formatting = {
        condition = root_has_file(clang_format_root_files),
      },
    }

    local function on_attach(client, _)
      if client.server_capabilities.document_formatting then
        vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
        vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
      end
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint.with(opts.eslint_diagnostics),
        null_ls.builtins.formatting.eslint.with(opts.eslint_formatting),
        null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
        null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
        null_ls.builtins.formatting.ocamlformat.with(opts.ocamlformat_formatting),
        null_ls.builtins.formatting.clang_format.with(opts.clang_format_formatting),
        null_ls.builtins.code_actions.eslint.with(opts.eslint_diagnostics),
        null_ls.builtins.code_actions.gitsigns,
      },
      on_attach = on_attach,
    })

  end },

  -- AI
  "Exafunction/codeium.vim",
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "mistral", -- The default model to use.
      display_mode = "split", -- The display mode. Can be "float" or "split".
      show_prompt = false, -- Shows the Prompt submitted to Ollama.
      show_model = true, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      list_models = "<omitted lua function>", -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    },
  },
}
