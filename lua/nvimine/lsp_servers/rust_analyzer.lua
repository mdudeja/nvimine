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
local capabilities = vim.lsp.protocol.make_client_capabilities() 

vim.lsp.config("rust-analyzer", {
    settings = settings,
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable("rust-analyzer")
