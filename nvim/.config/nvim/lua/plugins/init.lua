return {
  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
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
  -- finding stuff
  { "junegunn/fzf", dependencies = "junegunn/fzf.vim" },
  -- treesitter (highlightning, indentation, etc)
  { "nvim-treesitter/nvim-treesitter" },
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "TSPlaygroundToggle",
  },
  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "b0o/schemastore.nvim",
      "ionide/Ionide-vim",
    },
  },
  -- git
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },
  -- utils, dependency to alot of plugins
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
}
