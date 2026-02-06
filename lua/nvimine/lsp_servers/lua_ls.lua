local settings = {
    Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
            library = {
                vim.fn.expand "$VIMRUNTIME/lua",
                vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                "${3rd}/luv/library",
            },
        },
    },
}

local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")

vim.lsp.config("lua_ls", {
    settings = settings,
    on_attach = on_attach,
})

vim.lsp.enable "lua_ls"
