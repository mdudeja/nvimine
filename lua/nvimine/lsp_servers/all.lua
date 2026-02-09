local capabilities = require("nvimine.lsp_servers.serverCapabilities")

vim.lsp.config("*", { capabilities = capabilities })
