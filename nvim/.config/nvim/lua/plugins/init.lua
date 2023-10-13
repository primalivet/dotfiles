return {
  -- Misc
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  "nvim-lua/plenary.nvim",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
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
      "jose-elias-alvarez/null-ls.nvim",
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
