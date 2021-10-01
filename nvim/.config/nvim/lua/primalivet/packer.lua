local M = {}

local cmd = vim.api.nvim_command
local fn = vim.fn

local function packer_autoinstall()
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
        cmd "packadd packer.nvim"
    end
end

local function packer_register()
    require "packer".startup(
        function(use)
            use {"wbthomason/packer.nvim"}

            -- Trouble: Temporary disabled as I'm trying out a Nvim LSP ->
            -- Quickfix setup, see ./plugins/lsp/init.lua
            -- use {
            --     "folke/trouble.nvim",
            --     requires = "kyazdani42/nvim-web-devicons",
            --     config = function()
            --         require("primalivet.plugins.trouble").init()
            --     end
            -- }

            use {"editorconfig/editorconfig-vim"}

            use {"heavenshell/vim-jsdoc", run = "make install", ft = {"javascript", "javascript.jsx", "typescript"}}

            use {
                "hrsh7th/nvim-cmp",
                requires = {
                    "onsails/lspkind-nvim",
                    "hrsh7th/vim-vsnip",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-nvim-lua",
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-emoji"
                },
                config = function()
                    require "primalivet.plugins.cmp".init()
                end
            }

            use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = {"markdown"}}

            use {"jose-elias-alvarez/null-ls.nvim", requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}}

            use {
                "jose-elias-alvarez/nvim-lsp-ts-utils",
                requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim"}
            }

            use {"junegunn/vim-easy-align"}

            use {
                "lewis6991/gitsigns.nvim",
                requires = {"nvim-lua/plenary.nvim"},
                config = function()
                    require "primalivet.plugins.gitsigns".init()
                end
            }

            use {"lifepillar/vim-colortemplate"}

            -- use { 'lukas-reineke/indent-blankline.nvim', config = function() require'primalivet.plugins.indent-blankline'.init() end }

            use {
                "neovim/nvim-lspconfig",
                config = function()
                    require "primalivet.plugins.lsp".init()
                end
            }

            use {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require "primalivet.plugins.colorizer".init()
                end
            }

            use {
                "nvim-telescope/telescope.nvim",
                requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"kyazdani42/nvim-web-devicons"}},
                config = function()
                    require "primalivet.plugins.telescope".init()
                end
            }

            use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = function()
                    require "primalivet.plugins.treesitter".init()
                end
            }

            use {
                "nvim-treesitter/playground",
                requires = {{"nvim-treesitter/nvim-treesitter"}},
                config = function()
                    require "primalivet.plugins.treesitter-playground".init()
                end
            }

            use {
                "projekt0n/github-nvim-theme",
                config = function()
                    require("primalivet.plugins.github-theme").init()
                end
            }

            use {"ray-x/lsp_signature.nvim", requires = {"neovim/nvim-lspconfig"}}

            use {"tpope/vim-commentary"}

            use {"tpope/vim-fugitive"}

            use {"tpope/vim-repeat"}

            use {"tpope/vim-surround"}

            use {
                "windwp/nvim-autopairs",
                requires = "nvim-treesitter/nvim-treesitter",
                config = function()
                    require "primalivet.plugins.autopairs".init()
                end
            }

            use {"windwp/nvim-ts-autotag"}

            use {
                "yardnsm/vim-import-cost",
                run = "npm install"
            }
        end
    )
end

function M.init()
    packer_autoinstall()
    packer_register()
end

return M
