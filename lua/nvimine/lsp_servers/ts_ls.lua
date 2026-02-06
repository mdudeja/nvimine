local settings = {}

local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")

vim.lsp.config('ts_ls', {
    settings = settings,
    on_attach = on_attach,
})
vim.lsp.enable 'ts_ls'
