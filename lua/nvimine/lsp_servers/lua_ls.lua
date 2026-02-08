local settings = {
    Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
            library = {
                vim.fn.expand "$VIMRUNTIME/lua",
                vim.fn.stdpath "data" .. "/lazy/nvimine/config.types",
                vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                "${3rd}/luv/library",
            },
        },
    },
}

local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")

vim.lsp.config("lua-language-server", {
    settings = settings,
    on_attach = on_attach,
})

vim.lsp.enable "lua-language-server"
