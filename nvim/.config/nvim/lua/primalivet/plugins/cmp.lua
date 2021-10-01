local M = {}

function M.init()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    lspkind.init()

    cmp.setup(
        {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end
            },
            formatting = {
                format = function(entry, vim_item)
                    -- fancy icons and a name of kind
                    vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

                    -- set a name for each source
                    vim_item.menu =
                        ({
                        buffer = "[Buffer]",
                        path = "[Path]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[Lua]",
                        emoji = "[Emoji]"
                    })[entry.source.name]
                    return vim_item
                end
            },
            sources = {
                {name = "buffer"},
                {name = "path"},
                {name = "nvim_lsp"},
                {name = "nvim_lua"},
                {name = "emoji"}
            }
        }
    )
end

return M
