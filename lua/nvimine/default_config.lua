local M = {}

---@type nvimine.config?
M.config = nil

---@type nvimine.config.lsp_servers
M.default_lsp_servers = {
    lua_ls = { enabled = true, mason_name = "lua-language-server" },
    rust_analyzer = { enabled = true, mason_name = "rust-analyzer" },
    pyright = { enabled = true, mason_name = "pyright" },
    ts_ls = { enabled = true, mason_name = "typescript-language-server" },
}

---@type nvimine.config.plugins
M.default_plugins = {
    catppuccin = { enabled = true },
    conform = { enabled = true },
    indent_blankline = { enabled = true },
    lspconfig = { enabled = true },
    tree = { enabled = true },
    web_devicons = { enabled = true },
    which_key = { enabled = true },
    gitsigns = { enabled = true },
    mason = { enabled = true },
    mason_tool_installer = { enabled = true },
    cmp = { enabled = true },
    treesitter = { enabled = true },
    telescope = { enabled = true },
}

---@type nvimine.config
M.default_config = {
    enabled = true,
    lsp_servers = M.default_lsp_servers,
    plugins = M.default_plugins,
    diagnostics = true,
}

M.set_config = function(config)
    M.config = vim.tbl_deep_extend("force", M.default_config, config or {})
end

M.clear_config = function()
    M.config = nil
end

M.get_config = function()
    return M.config or M.default_config
end

return M
