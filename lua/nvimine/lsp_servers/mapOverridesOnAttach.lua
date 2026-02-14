local onAttachGenerator = function(language)
    local map = vim.keymap.set

    local on_attach = function(_, bufnr)
        local function opts(desc)
            return { buffer = bufnr, desc = "LSP " .. desc }
        end

        map("n", "ld", function() Snacks.picker.lsp_definitions() end, opts "Go to [d]efinition")
        map("n", "lD", function() Snacks.picker.lsp_declarations() end, opts "Go to [D]eclaration")
        map("n", "lr", function() Snacks.picker.lsp_references() end, opts "Go to [r]eferences")
        map("n", "lI", function() Snacks.picker.lsp_implementations() end, opts "Go to [I]mplementation")
        map("n", "ly", function() Snacks.picker.lsp_type_definitions() end, opts "Go to T[y]pe definition")
        map("n", "ls", function() Snacks.picker.lsp_symbols() end, opts "Document Symbols")
        map("n", "lS", function() Snacks.picker.lsp_workspace_symbols() end, opts "Workspace Symbols")
        map("n", "lwa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
        map("n", "lwr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
        map("n", "lai", function() Snacks.picker.lsp_incoming_calls() end, opts "C[a]lls Incoming")
        map("n", "lao", function() Snacks.picker.lsp_outgoing_calls() end, opts "C[a]lls Outgoing")
        map("n", "<F2>", vim.lsp.buf.rename, opts "Rename symbol")

        map("n", "lws", function() Snacks.picker.lsp_workspace_folders() end, opts "Show workspace folders")

        if language == "typescript" then
            map("n", "lsd", vim.cmd "LspTypescriptGoToSourceDefinition", opts "Go to [s]ource [d]efinition")
        end

        if language == "python" then
            map("n", "loi", ":LspPyrightOrganizeImports<CR>", opts "Organize imports")
        end

        if language == "rust" then
            map("n", "lcr", ":LspCargoReload<CR>", opts "Reload cargo workspace")
        end
    end

    return on_attach
end

return onAttachGenerator
