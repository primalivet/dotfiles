vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.diffopt:append("vertical")
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.ignorecase = true
vim.opt.laststatus = 1
vim.opt.path:append("**,nvim/.config/**")
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "auto:1-3"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.timeoutlen = 500
vim.opt.undofile = true -- uses the default undodir "~/.local/share/nvim/undo
vim.opt.updatetime = 100
vim.opt.wildignore:append("*/node_modules/**,**/_build/**,**bin**,**/_opam/**")
vim.opt.wildmode = "lastused:list:full"
vim.opt.wrap = false

vim.cmd([[colorscheme sixteen]])
vim.cmd(":packadd cfilter") -- enable filter quickfix list

-- KEYMAPS

local function toggle_relative_numbers()
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

local function keymap_set(mode, lhs, rhs, opts)
  local default_opt = { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend("force", default_opt, opts))
end

keymap_set("n", "j", "gj", { desc = "Move down over wrapped lines" })
keymap_set("n", "k", "gk", { desc = "Move up over wrapped lines" })
keymap_set("v", "<", "<gv", { desc = "Keep visual selection while indenting" })
keymap_set("v", ">", ">gv", { desc = "Keep visual selection while indenting" })
keymap_set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down" })
keymap_set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })
keymap_set("n", "n", "nzz", { desc = "Center on search jump natural direction" })
keymap_set("n", "N", "Nzz", { desc = "Center on search jump unnatural direction" })
keymap_set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Add buffer diagnostics to Location list" })
keymap_set("n", "<leader>ts", ":nohlsearch<CR>", { desc = "Toggle search highlight" })
keymap_set("n", "<leader>tn", toggle_relative_numbers, { desc = "Toggle relative numbers" })
keymap_set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape in terminal" })

-- USERCOMMANDS

vim.api.nvim_create_user_command("Prettier", function()
  local prettier_exec = vim.fn.filereadable(vim.fn.getcwd() .. "/node_modules/.bin/prettier")
  if prettier_exec == 0 then
    print("Local Prettier executable not found in node_modules")
    return
  else
    print("Format with prettier")
    vim.cmd [[%!npx prettier --stdin-filepath %]]
  end
end, {})

-- AUTOCOMMANDS

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = vim.api.nvim_create_augroup("PrimalivetHighlightYank", { clear = true }),
  -- pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = vim.api.nvim_create_augroup("PrimalivetTerm", { clear = true }),
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
})

vim.diagnostic.config({
  virtual_text = false,
})

-- PLUGINS

require("primalivet.mini")
local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add("nvim-treesitter/nvim-treesitter")
  require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  })
end)

now(function()
  -- TODO: make sure fzf is in path and get fzf path dynamically
  vim.opt.runtimepath:append("/opt/homebrew/opt/fzf")
  add("junegunn/fzf.vim")
  vim.g.fzf_layout = { down = "50%" }
  vim.g.fzf_preview_window = {}

  keymap_set("n", "<leader>sf", ":Files<CR>", { desc = "Search Files" })
  keymap_set("n", "<leader>sl", ":Rg<CR>", { desc = "Search Live" })
  keymap_set("n", "<leader>sc", ":Commands<CR>", { desc = "Search Commands" })

  vim.cmd [[autocmd! FileType fzf set laststatus=0 noshowmode noruler
         \| autocmd BufLeave <buffer> set laststatus=1 showmode ruler]]
end)

now(function()
  add("tpope/vim-fugitive")
end)

now(function()
  require("mini.surround").setup()
  require("mini.align").setup()
  require("mini.diff").setup({
    view = {
      style = "sign",
      signs = { add = "+", change = "~", delete = "_" },
    },
  })
end)


now(function()
  add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "stevearc/conform.nvim"
    },
  })
  require("conform").setup({
    default_format_opts = { stop_after_first = true },
    formatters_by_ft = {
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
    },
  })

  local function format_buffer()
    require("conform").format({
      async = true,
      lsp_fallback = true,
      filter = function(client) return client.name ~= "tsserver" end,
    })
  end
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
      --HINT: format_buffer calls vim.lsp.buf.format() for all filetypes except
      --black sheep tsserver, for js/ts we use prettier :/
      keymap_set("n", "<leader>f", format_buffer, { desc = "Format buffer" })

      -- Neovim defaults coming in 0.11.X (TODO: remove when on 0.11)
      keymap_set("n", "grn", vim.lsp.buf.rename, { desc = "vim.lsp.buf.rename()" })
      keymap_set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "vim.lsp.buf.code_action()" })
      keymap_set("n", "grr", vim.lsp.buf.references, { desc = "vim.lsp.buf.references()" })
      keymap_set("i", "<C-S>", vim.lsp.buf.signature_help, { desc = "vim.lsp.buf.signature_help()" })
    end,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

  local servers = {
    terraformls = {},
    clangd = {},
    tsserver = {},
    eslint = {},
    gopls = {},
    templ = {},
    prismals = {},
    cssls = {},
    html = {},
    ocamllsp = {
      settings = {
        codelens = true,
        inlayHints = true,
      },
    },
    lua_ls = {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = { "${3rd}/luv/library", unpack(vim.api.nvim_get_runtime_file("", true)) },
          },
          completion = { callSnippet = "Replace" },
          diagnostics = { disable = { "missing-fields" } },
        },
      },
    },
  }

  require("mason").setup()

  local servers_to_install = vim.tbl_filter(function(name)
    local blacklist = { "ocamllsp" }
    return not vim.tbl_contains(blacklist, name)
  end, vim.tbl_keys(servers))

  local ensure_installed = servers_to_install
  vim.list_extend(ensure_installed, { "stylua" })
  require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

  require("mason-lspconfig").setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        require("lspconfig")[server_name].setup(server)
      end,
    },
  })
end)

now(function()
  add({
    source = "hrsh7th/nvim-cmp",
    depends = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "neovim/nvim-lspconfig",
    },
  })

  local cmp = require("cmp")

  cmp.setup({
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
    mapping = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<C-l"] = cmp.mapping(function()
        -- TODO: move right in snippet
      end),
      ["<C-h"] = cmp.mapping(function()
        -- TODO: move left in snippet
      end),
    }),
    sources = require("cmp").config.sources({
      { name = "nvim_lsp", group_index = 1 },
      {
        name = "buffer",
        group_index = 2,
        option = {
          get_bufnrs = vim.api.nvim_list_bufs, -- search in all buffers
        },
      },
      { name = "path",     group_index = 3 },
    }),
  })
end)

now(function()
  add("zbirenbaum/copilot.lua")
  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = true, auto_refresh = true },
  })
end)

-- require("primalivet.cmd-comp")
-- require("primalivet.robot")
