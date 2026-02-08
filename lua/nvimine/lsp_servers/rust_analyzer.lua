local settings = {
    ["rust-analyzer"] = {
        cargo = {
            allFeatures = true,
        },
        checkOnSave = {
            command = "clippy",
        },
    },
}

local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")

vim.lsp.config("rust-analyzer", {
    settings = settings,
    on_attach = on_attach,
})

vim.lsp.enable "rust-analyzer"
