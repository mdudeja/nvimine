local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")
local capabilities = vim.lsp.protocol.make_client_capabilities() 

vim.lsp.config("pyright", {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable("pyright")
