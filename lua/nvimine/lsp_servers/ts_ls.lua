local settings = {}

local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")

vim.lsp.config('typescript-language-server', {
    settings = settings,
    on_attach = on_attach,
})
vim.lsp.enable 'typescript-language-server'
