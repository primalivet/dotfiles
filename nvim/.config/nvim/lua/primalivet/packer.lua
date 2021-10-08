local M = {}

local cmd = vim.api.nvim_command
local fn = vim.fn

local function startup_cb(use)
    -- The plugin manager
    use {"gerw/vim-HiLinkTrace"}
    use {"wbthomason/packer.nvim"}
    use {"nvim-lua/plenary.nvim"}

    -- .editorconfig project files
    use {"editorconfig/editorconfig-vim"}

    -- Generate JSDoc from a function signature
    use {"heavenshell/vim-jsdoc", run = "make install", ft = {"javascript", "javascript.jsx", "typescript"}}

    -- Kitty config file syntax
    use {"fladson/vim-kitty"}

    use {
        "junegunn/fzf",
        config = function()
            -- should run pre loading
            vim.api.nvim_set_var("fzf_layout", {down = "50%"})
            vim.api.nvim_set_var("fzf_preview_window", {})
            vim.cmd "command! Dotfiles exe 'Files ~/Code/OSS/dotfiles'"
        end
    }
    use {"junegunn/fzf.vim"}

    -- Which Key
    use {
        "folke/which-key.nvim",
        config = function()
            require "which-key".setup {}
        end
    }

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

    use {
        "sindrets/diffview.nvim",
        config = function()
            require "primalivet.plugins.diffview".init()
        end
    }

    -- Live preview of markdown while typeing
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = {"markdown"}}

    -- Automatically insert tags for html and jsx etc.
    use {"windwp/nvim-ts-autotag"}

    -- Show import cost of npm packages
    use {"yardnsm/vim-import-cost", run = "npm install"}

    -- Filebrower (only adapter to vifm cli program)
    use {"vifm/vifm.vim"}

    -- Colorscheme
    use {"gruvbox-community/gruvbox"}
    use {"jnurmine/Zenburn"}

    -- use {
    --     "projekt0n/github-nvim-theme",
    --     config = function()
    --         require("primalivet.plugins.github-theme").init()
    --     end
    -- }

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
            require "gitsigns".setup {
                signs = {
                    add = {hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
                    change = {
                        hl = "GitSignsChange",
                        text = "~",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = "_",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = "‾",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = "±",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    }
                }
            }

            -- Gitsign commands
            vim.cmd "command! GitsignsResetHunk exe 'Gitsigns reset_hunk'"
            vim.cmd "command! GitsignsNextHunk exe 'Gitsigns next_hunk'"
            vim.cmd "command! GitsignsPrevHunk exe 'Gitsigns prev_hunk'"
            vim.cmd "command! GitsignsPreviewHunk exe 'Gitsigns preview_hunk'"
        end
    }

    -- Show colors in color, like #ffffff whould be show in white background
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "colorizer".setup()
        end
    }

    -- Icons
    use {"kyazdani42/nvim-web-devicons"}

    -- Search and find of a lot of things
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
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

    use {"simrat39/symbols-outline.nvim"}
end

function M.init()
    -- auto install
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
        cmd "packadd packer.nvim"
    end
    -- start
    require "packer".startup(startup_cb)
end

return M
