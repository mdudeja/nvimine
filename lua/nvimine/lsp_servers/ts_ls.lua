local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")
local capabilities = vim.lsp.protocol.make_client_capabilities() 

vim.lsp.config("typescript-language-server", {
    on_attach = on_attach,
    capabilities = capabilities,
})
vim.lsp.enable("typescript-language-server")
