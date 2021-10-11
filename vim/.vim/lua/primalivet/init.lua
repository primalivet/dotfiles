local cmd = vim.cmd
local opt = vim.opt
local M = {}


function M.init()
        opt.completeopt = 'menuone,noinsert,noselect'
        -- opt.shortmess = opt.shortmess .. 'c'

        require'primalivet.plugins.lsp'.init()
        require'primalivet.plugins.treesitter'.init()

        cmd[[
        augroup NeovimInit
                autocmd!
                 autocmd BufEnter * lua require('completion').on_attach()
        augroup END
        ]]
end

return M
