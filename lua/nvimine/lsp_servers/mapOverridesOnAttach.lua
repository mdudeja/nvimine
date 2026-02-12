local onAttachGenerator = function(language)
    local map = vim.keymap.set

    local on_attach = function(_, bufnr)
        local function opts(desc)
            return { buffer = bufnr, desc = "LSP " .. desc }
        end

        map("n", "gd", function() Snacks.picker.lsp_definitions() end, opts "Go to [d]efinition")
        map("n", "gD", function() Snacks.picker.lsp_declarations() end, opts "Go to [D]eclaration")
        map("n", "gr", function() Snacks.picker.lsp_references() end, opts "Go to [r]eferences")
        map("n", "gI", function() Snacks.picker.lsp_implementations() end, opts "Go to [I]mplementation")
        map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, opts "Go to T[y]pe definition")
        map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, opts "Document Symbols")
        map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, opts "Workspace Symbols")
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
        map("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, opts "C[a]lls Incoming")
        map("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, opts "C[a]lls Outgoing")
        map("n", "<leader>r", vim.lsp.buf.rename, opts "Rename symbol")

        map("n", "<leader>ll", function() Snacks.picker.lsp_workspace_folders() end, opts "Show workspace folders")

        if language == "typescript" then
            map("n", "gsd", vim.cmd "LspTypescriptGoToSourceDefinition", opts "Go to [s]ource [d]efinition")
        end

        if language == "python" then
            map("n", "<leader>oi", ":LspPyrightOrganizeImports<CR>", opts "Organize imports")
        end

        if language == "rust" then
            map("n", "<leader>cr", ":LspCargoReload<CR>", opts "Reload cargo workspace")
        end
    end

    return on_attach
end

return onAttachGenerator
