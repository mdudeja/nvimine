local map = vim.keymap.set

local on_attach = function(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "<LocalLeader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
    map("n", "<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

    map("n", "<LocalLeader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "List workspace folders")

    map("n", "<LocalLeader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
    map("n", "<LocalLeader>ra", vim.lsp.buf.rename, opts "Rename symbol")
end

return on_attach
