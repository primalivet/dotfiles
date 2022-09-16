local M = {}

local function initialize_packer()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    -- Bootstrap (installs packer, requires restart after execution)
    print("Installing packer, you have to restart neovim")
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    return nil
  end
  local packer = require("packer")
  local use = packer.use
  packer.init()
  return use
end

function M.init()
  local use = initialize_packer()

  if use == nil then
    print("Packer not available, you might have to restart Neovim")
    return
  end

  -- Packer itself, it beeing here enables packer to update itself
  use("wbthomason/packer.nvim")
  -- Dependency lib used by alot of packages
  use("nvim-lua/plenary.nvim")
  -- Common editor configuration
  use("editorconfig/editorconfig-vim")
  -- Surround text objects with e.g. ",',[,(,{ etc
  use("tpope/vim-surround")
  -- Enable "." (dot command) on for example surrounds
  use("tpope/vim-repeat")
  -- Git integration
  use("tpope/vim-fugitive")
  -- Enable language agnostic comments
  use("tpope/vim-commentary")
  -- Fuzzy finder
  use({ "junegunn/fzf", requires = { "junegunn/fzf.vim" } })
  -- Git signs in the signcolumn, also handles "reset a hunk", "preview hunk"
  -- etc.
  use({ "lewis6991/gitsigns.nvim" })
  -- Treesitter config abstraction and "playground" to see treesitter the
  -- parsed Abstract Syntax Tree
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = { "nvim-treesitter/playground" },
    run = ":TSUpdate",
  })
  -- Language Sever Protocol "LSP" config abstraction
  use({
    "neovim/nvim-lspconfig",
    requires = { "hrsh7th/nvim-cmp", "jose-elias-alvarez/nvim-lsp-ts-utils", "simrat39/rust-tools.nvim" },
  })
  -- LSP integration for formatting, linting, codeactions etc.
  use({ "jose-elias-alvarez/null-ls.nvim" })
  -- Completion engine and "completers" for several things
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
  })
  -- Debugger for DAP protocol
  -- use({ "mfussenegger/nvim-dap" })
end

return M
