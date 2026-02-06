local settings = {}

vim.lsp.config("pyright", {
    settings = settings,
    on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach"),
})

vim.lsp.enable "pyright"
