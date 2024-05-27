vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd([[colorscheme sixteen]])
vim.cmd(":packadd cfilter") -- enable filter quickfix list

vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.diffopt:append("vertical")
vim.opt.expandtab = true
vim.opt.fileignorecase = true
vim.opt.grepformat:append("%f:%l:%c:%m,%f:%l:%m")
vim.opt.grepprg = "rg --vimgrep --no-heading --hidden"
vim.opt.ignorecase = true
vim.opt.listchars:append("space:·")
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes:2"
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

-- KEYMAPS

local function toggle_numbers()
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
keymap_set("n", "[c", ":cprevious<CR>", { desc = "Previous Quickfix item" })
keymap_set("n", "]c", ":cnext<CR>", { desc = "Next Quickfix item" })
keymap_set("n", "[C", ":cfirst<CR>", { desc = "First Quickfix item" })
keymap_set("n", "]C", ":clast<CR>", { desc = "Last Quickfix item" })
keymap_set("n", "[l", ":lprevious<CR>", { desc = "Previous Location list item" })
keymap_set("n", "]l", ":lnext<CR>", { desc = "Next Location list item" })
keymap_set("n", "[L", ":lfirst<CR>", { desc = "First Location list item" })
keymap_set("n", "]L", ":llast<CR>", { desc = "Last Location list item" })
keymap_set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic item" })
keymap_set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic item" })
keymap_set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Add buffer diagnostics to Location list" })
keymap_set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
keymap_set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
keymap_set("n", "<leader>tl", ":set list!<CR>", { desc = "Toggle list chars" })
keymap_set("n", "<leader>tp", ":set invpaste<CR>", { desc = "Toggle paste mode" })
keymap_set("n", "<leader>ts", ":nohlsearch<CR>", { desc = "Toggle search highlight" })
keymap_set("n", "<leader>tn", toggle_numbers, { desc = "Toggle relative numbers" })

keymap_set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape in terminal" })

-- AUTOCOMMANDS

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = vim.api.nvim_create_augroup("PrimalivetHighlightYank", { clear = true }),
  pattern = "*",
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
local function executable(name)
  return vim.fn["executable"](name) == 1
end

-- PLUGINS

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })
local add, now = MiniDeps.add, MiniDeps.now

now(function()
  require("mini.extra").setup()
  require("mini.surround").setup()
  require("mini.comment").setup()
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
  keymap_set("n", "<leader>sb", ":Pick buffers<CR>", { desc = "Search Buffers" })
  keymap_set("n", "<leader>sh", ":Pick help<CR>", { desc = "Search Help" })
  keymap_set("n", "<leader>sl", ":Pick grep_live<CR>", { desc = "Search Live" })
  keymap_set("n", "<leader>sc", ":Pick git_commits<CR>", { desc = "Search Commits" })
  keymap_set("n", "<leader>sr", ":Pick lsp scope='references'<CR>", { desc = "Search References" })
  keymap_set("n", "<leader>sws", ":Pick lsp scope='workspace_symbol'<CR>", { desc = "Search Workspace Symbol" })
  keymap_set("n", "<leader>sds", ":Pick lsp scope='document_symbol'<CR>", { desc = "Search Document Symbol" })

  require("mini.completion").setup({
    lsp_completion = {
      source_func = "omnifunc",
      auto_setup = false,
    },
  })
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
  add("lewis6991/gitsigns.nvim")
  require("gitsigns").setup({
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "±" },
      untracked = { text = "" },
    },
  })

  keymap_set("n", "[h", require("gitsigns").prev_hunk, { desc = "Previous Git hunk" })
  keymap_set("n", "]h", require("gitsigns").next_hunk, { desc = "Next Git hunk" })

  vim.api.nvim_create_user_command("ResetHunk", "Gitsigns reset_hunk", { desc = "Reset hunk under cursor" })
  vim.api.nvim_create_user_command("PreviewHunk", "Gitsigns preview_hunk", { desc = "Preview hunk under cursor" })
end)

now(function()
  add("stevearc/conform.nvim")
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
    },
  })

  keymap_set("n", "<leader>f", function()
    require("conform").format({
      async = true,
      lsp_fallback = true,
      filter = function(client)
        return client.name ~= "tsserver"
      end,
    })
  end, { desc = "Format buffer" })
end)

now(function()
  add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
      vim.bo[event.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
      -- HINT: Formatting is setup with conform (which falls back to lsp)
      keymap_set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      keymap_set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      keymap_set("n", "K", vim.lsp.buf.hover, { desc = "Hover information" })
      keymap_set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
      keymap_set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
      keymap_set("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })
      keymap_set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
      keymap_set("n", "gtd", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
      keymap_set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
    end,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local servers = {
    terraformls = {},
    clangd = {},
    tsserver = {},
    eslint = {},
    gopls = {},
    prismals = {},
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
  vim.g.codeium_manual = true
  add("Exafunction/codeium.vim")
  vim.api.nvim_create_autocmd({ "BufRead", "DirChanged" }, {
    group = vim.api.nvim_create_augroup("PrimalivetCodeium", { clear = true }),
    pattern = "*",
    callback = function()
      if not string.match(vim.fn.getcwd(), "/Code/OSS") then
        vim.cmd("CodeiumDisable")
        return
      end

      keymap_set("i", "<C-x><C-a>", vim.fn["codeium#Complete"], { desc = "Codeium complete" })
      -- keymap_set("i", "XXXXXXX", function() vim.fn["codeium#CycleCompletions"](1) end, { desc = "Codium next suggestion"})
      -- keymap_set("i", "XXXXXXX", function() vim.fn["codeium#CycleCompletions"](-1) end, { desc = "Codeium previous suggestion"})
      -- keymap_set("i", "XXXXXXX", vim.fn["codeium#Clear"], { desc = "Codeium clear suggestion"})
      -- keymap_set("i", "XXXXXXX", vim.fn["codeium#Accept"], { desc = "Codeium accept suggestion"})
    end,
  })
end)

now(function()
  add("dmmulroy/tsc.nvim")
  require("tsc").setup({})
end)

require("primalivet.robot")
