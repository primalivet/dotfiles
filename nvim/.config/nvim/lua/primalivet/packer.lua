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
            -- The plugin manager
            use {"wbthomason/packer.nvim"}

            -- .editorconfig project files
            use {"editorconfig/editorconfig-vim"}

            -- Generate JSDoc from a function signature
            use {"heavenshell/vim-jsdoc", run = "make install", ft = {"javascript", "javascript.jsx", "typescript"}}

            -- Easy to align stuff around '=' for example, usefull for Markdown
            use {"junegunn/vim-easy-align"}

            -- Show function signature in a "floating window" when typeing
            use {"ray-x/lsp_signature.nvim", requires = {"neovim/nvim-lspconfig"}}

            -- Comment and uncomment
            use {"tpope/vim-commentary"}

            -- Easier to work with surrounding stuff like () {} and ""
            use {"tpope/vim-surround"}

            -- Enables to repeat, maily use it to repeat commands from commentary and surround above
            use {"tpope/vim-repeat"}

            -- Git integration (dont use that much, perfer git cli)
            use {"tpope/vim-fugitive"}

            -- Live preview of markdown while typeing
            use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = {"markdown"}}

            -- Automatically insert tags for html and jsx etc.
            use {"windwp/nvim-ts-autotag"}

            -- Show import cost of npm packages
            use {"yardnsm/vim-import-cost", run = "npm install"}

            -- A theme i like (Good treesitter support)
            use {
                "projekt0n/github-nvim-theme",
                config = function()
                    require("primalivet.plugins.github-theme").init()
                end
            }

            -- Automatically insert pairs like () {} "" etc.
            use {
                "windwp/nvim-autopairs",
                requires = "nvim-treesitter/nvim-treesitter",
                config = function()
                    require "primalivet.plugins.autopairs".init()
                end
            }

            -- Show git changes in the signcolumn, revert changes etc.
            use {
                "lewis6991/gitsigns.nvim",
                requires = {"nvim-lua/plenary.nvim"},
                config = function()
                    require "gitsigns".setup {}
                end
            }

            -- Show colors in color, like #ffffff whould be show in white background
            use {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require "colorizer".setup()
                end
            }

            -- Search and find of a lot of things
            use {
                "nvim-telescope/telescope.nvim",
                requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"kyazdani42/nvim-web-devicons"}},
                config = function()
                    require "primalivet.plugins.telescope".init()
                end
            }

            -- Better code syntax support
            use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = function()
                    require "primalivet.plugins.treesitter".init()
                end
            }

            -- This is a tool to "view" what syntax group is used on a particular row/column
            use {
                "nvim-treesitter/playground",
                requires = {{"nvim-treesitter/nvim-treesitter"}},
                config = function()
                    require "primalivet.plugins.treesitter-playground".init()
                end
            }

            -- Formatting
            use {"jose-elias-alvarez/null-ls.nvim", requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}}

            -- Completion
            use {
                "hrsh7th/nvim-cmp",
                requires = {
                    "hrsh7th/vim-snip",
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

            -- Language Servers
            use {
                "neovim/nvim-lspconfig",
                config = function()
                    require "primalivet.plugins.lsp".init()
                end
            }

            -- Langauge server helpers, mainly for Typescript
            use {
                "jose-elias-alvarez/nvim-lsp-ts-utils",
                requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim"}
            }
        end
    )
end

function M.init()
    packer_autoinstall()
    packer_register()
end

return M
