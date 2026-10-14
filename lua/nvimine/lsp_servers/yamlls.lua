local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")("yaml")
local capabilities = require("nvimine.lsp_servers.serverCapabilities")

local has_schemastore, schemastore = pcall(require, "schemastore")

vim.lsp.config("yamlls", {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
    root_markers = { ".git" },
    settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
            keyOrdering = false,
            format = { enable = true },
            validate = true,
            -- SchemaStore.nvim supplies the catalog; disable the server's own download
            schemaStore = { enable = false, url = "" },
            schemas = has_schemastore and schemastore.yaml.schemas() or {},
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable("yamlls")
