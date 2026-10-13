local onAttachGenerator = function(language)
    local map = vim.keymap.set

    local on_attach = function(_, bufnr)
        local function opts(desc)
            return { buffer = bufnr, desc = "LSP " .. desc }
        end

        map("n", "<leader>ld", function() Snacks.picker.lsp_definitions() end, opts "Go to [d]efinition")
        map("n", "<leader>lD", function() Snacks.picker.lsp_declarations() end, opts "Go to [D]eclaration")
        map("n", "<leader>lr", function() Snacks.picker.lsp_references() end, opts "Go to [r]eferences")
        map("n", "<leader>lI", function() Snacks.picker.lsp_implementations() end, opts "Go to [I]mplementation")
        map("n", "<leader>ly", function() Snacks.picker.lsp_type_definitions() end, opts "Go to T[y]pe definition")
        map("n", "<leader>ls", function() Snacks.picker.lsp_symbols() end, opts "Document Symbols")
        map("n", "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, opts "Workspace Symbols")
        map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
        map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
        map("n", "<leader>lai", function() Snacks.picker.lsp_incoming_calls() end, opts "C[a]lls Incoming")
        map("n", "<leader>lao", function() Snacks.picker.lsp_outgoing_calls() end, opts "C[a]lls Outgoing")
        map("n", "<F2>", vim.lsp.buf.rename, opts "Rename symbol")

        map("n", "<leader>lws", function() Snacks.picker.lsp_workspace_folders() end, opts "Show workspace folders")

        if language == "typescript" then
            map("n", "<leader>lg", "<cmd>LspTypescriptGoToSourceDefinition<CR>", opts "Go to source definition")
        end

        if language == "python" then
            map("n", "<leader>lo", "<cmd>LspPyrightOrganizeImports<CR>", opts "Organize imports")
        end

        if language == "rust" then
            map("n", "<leader>lc", "<cmd>LspCargoReload<CR>", opts "Reload cargo workspace")
        end
    end

    return on_attach
end

return onAttachGenerator
