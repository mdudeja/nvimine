local M = {}

---@type nvimine.config?
M.config = nil

---@type nvimine.config.lsp_servers
M.default_lsp_servers = {
    lua_ls = true,
    rust_analyzer = true,
    pyright = true,
    ts_ls = true,
}

---@type nvimine.config.plugins
M.default_plugins = {
    catppuccin = { enabled = true, config = {} },
    conform = { enabled = true, config = {} },
    indent_blankline = { enabled = true, config = {} },
    lspconfig = { enabled = true, config = {} },
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
