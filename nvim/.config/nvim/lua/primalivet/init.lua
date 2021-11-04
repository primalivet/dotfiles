local M = {}
local g = vim.g
local opt = vim.opt

function M.init()
    g.mapleader = " " -- Space is leader
    opt.cursorline = false -- show what line i'm on
    opt.diffopt = "vertical"
    opt.fillchars = "vert:|"
    opt.foldenable = true --  use folds
    opt.foldlevel = 100 -- start folding at level 100 (never)
    opt.showcmd = true -- show what I type
    opt.foldmethod = "indent" --by indent
    opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
    opt.grepprg = "rg --vimgrep --no-heading --hidden"
    opt.hidden = true -- dont unload abandoned buffers, just hide em
    opt.ignorecase = true --  dont be case sensitive
    opt.listchars = "tab:>--,space:·,trail:·" -- make em look like this
    opt.number = true -- show numbers
    opt.path = "**"
    opt.relativenumber = true --relative to current row
    opt.scrolloff = 5 -- scroll view when cursor gets close to edge
    opt.sidescrolloff = 5 -- in both directions
    opt.smartcase = true --  unless i type CAPS
    opt.termguicolors = true
    opt.timeoutlen = 500 --timeout for mappings and
    opt.updatetime = 100 --updatetime for events
    opt.wildignore = "*/node_modules/*,*/dist/*,*/build/*"
    opt.wrap = false -- but dont wrap
    vim.cmd ":packadd cfilter" -- enable filter quickfix list

    _G.reload_config = function()
        require("plenary.reload").reload_module("primalivet")
        require("primalivet").init()
        print("Reloaded config")
    end

    require "primalivet.packer".init()
    require "primalivet.mappings".init()
end

return M
