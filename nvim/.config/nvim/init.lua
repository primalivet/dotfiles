vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = false
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.diffopt:append("vertical")
vim.opt.expandtab = true
vim.opt.fillchars ="vert:|"
vim.opt.ignorecase = true
vim.opt.laststatus = 1
vim.opt.listchars:append("space:·")
vim.opt.path:append("**,nvim/.config/**")
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
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

local function toggle_background()
  if vim.opt.background:get() == "dark" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
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
keymap_set("n", "<leader>tb", toggle_background, { desc = "Toggle background color" })
keymap_set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape in terminal" })

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

-- PLUGINS

require("primalivet.mini")
local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add("tpope/vim-dadbod")
  add("kristijanhusak/vim-dadbod-ui")
  add("kristijanhusak/vim-dadbod-completion")
  vim.cmd("autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni")
end)

now(function()
  require("mini.extra").setup()
  require("mini.surround").setup()
  require("mini.align").setup()
  require("mini.diff").setup({
    view = {
      style = "sign",
      signs = { add = "+", change = "~", delete = "_" },
    },
  })
  require("mini.pick").setup({
    window = {
      config = function()
        local height = math.floor(0.5 * vim.o.lines)
        local row = math.floor(vim.o.lines - height)
        return { anchor = "NW", width = vim.o.columns, height = height, row = row, col = 0 }
      end,
    },
  })

  vim.ui.select = MiniPick.ui_select

  keymap_set("n", "<leader>ss", ":Pick resume<CR>", { desc = "Search Same (as before)" })
  keymap_set("n", "<leader>sf", ":Pick files<CR>", { desc = "Search Files" })
  keymap_set("n", "<leader>sl", ":Pick grep_live<CR>", { desc = "Search Live" })
  keymap_set("n", "<leader>sc", ":Pick commands<CR>", { desc = "Search Commands" })
  keymap_set("n", "<leader>sr", ":Pick lsp scope='references'<CR>", { desc = "Search References" })
  keymap_set("n", "<leader>sws", ":Pick lsp scope='workspace_symbol'<CR>", { desc = "Search Workspace Symbol" })
  keymap_set("n", "<leader>sds", ":Pick lsp scope='document_symbol'<CR>", { desc = "Search Document Symbol" })
end)

now(function()
  add("nvim-treesitter/nvim-treesitter")
  require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  })
end)

now(function()
  add("tpope/vim-fugitive")
end)

now(function()
  add("stevearc/conform.nvim")
  require("conform").setup({
    default_format_opts = {
      stop_after_first = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      templ = { "templ" },
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
      filter = function(client)
        return client.name ~= "tsserver"
      end,
    })
  end
  keymap_set("n", "<leader>f", format_buffer, { desc = "Format buffer" })
end)

now(function()
  add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
      --HINT: Formatting is setup with conform (which falls back to lsp)
      -- vim.bo[event.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

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
      { name = "copilot", group_index = 2 },
      {
        name = "buffer",
        group_index = 2,
        option = {
          get_bufnrs = vim.api.nvim_list_bufs, -- search in all buffers
        },
      },
      { name = "path", group_index = 3 },
    }),
  })
end)

now(function()
  if not string.match(vim.fn.getcwd(), "/Code/OSS") then
    return
  end

  vim.g.codeium_manual = true
  add("Exafunction/codeium.vim")
  vim.api.nvim_create_autocmd({ "BufRead", "DirChanged" }, {
    group = vim.api.nvim_create_augroup("PrimalivetCodeium", { clear = true }),
    pattern = "*",
    callback = function()
      keymap_set("i", "<C-x><C-a>", vim.fn["codeium#Complete"], { desc = "Codeium complete" })
      -- keymap_set("i", "XXXXXXX", function() vim.fn["codeium#CycleCompletions"](1) end, { desc = "Codium next suggestion"})
      -- keymap_set("i", "XXXXXXX", function() vim.fn["codeium#CycleCompletions"](-1) end, { desc = "Codeium previous suggestion"})
      -- keymap_set("i", "XXXXXXX", vim.fn["codeium#Clear"], { desc = "Codeium clear suggestion"})
      -- keymap_set("i", "XXXXXXX", vim.fn["codeium#Accept"], { desc = "Codeium accept suggestion"})
    end,
  })
end)

now(function()
  if not string.match(vim.fn.getcwd(), "/Code/VCE") then
    return
  end

  add({
    source = "zbirenbaum/copilot.lua",
    depends = { "zbirenbaum/copilot-cmp" }
  })

  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = true }
  })
  require("copilot_cmp").setup()
end)

now(function()
  add("dmmulroy/tsc.nvim")
  require("tsc").setup({})
end)

require("primalivet.robot")
