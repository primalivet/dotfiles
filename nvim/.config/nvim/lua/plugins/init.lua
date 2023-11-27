-- Remove float borders
vim.g.lsp_zero_ui_float_border = 0
-- Disable Codeium bindings
vim.g.codeium_disable_bindings = 1
vim.g.codeium_manual = 1

return {
  -- Misc
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        menu = {
          borderchars = {"", "", "", "", "", "", "", ""},
        },
      })
    end,
  },
  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "TSPlaygroundToggle",
  },
  { "junegunn/fzf", dependencies = "junegunn/fzf.vim" },
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    config = false,
    dependencies = {
      "nvimtools/none-ls.nvim",
      "b0o/schemastore.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Completion (and snippets)
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      -- Sources
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "davidsierradz/cmp-conventionalcommits",
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "Exafunction/codeium.vim",
    },
  },
}
