local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")("json")
local capabilities = require("nvimine.lsp_servers.serverCapabilities")

-- Schemas for package.json, tsconfig.json, .eslintrc, GitHub workflows, ...
local has_schemastore, schemastore = pcall(require, "schemastore")

vim.lsp.config("jsonls", {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    root_markers = { ".git" },
    init_options = { provideFormatter = true },
    settings = {
        json = {
            schemas = has_schemastore and schemastore.json.schemas() or {},
            validate = { enable = true },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable("jsonls")
