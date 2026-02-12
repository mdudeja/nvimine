local M = {}
M.initialized = false

local merge_plugin_opts = function(default_opts, user_opts)
    if type(user_opts) ~= "table" then
        return default_opts
    end

    local merged_opts = {}
    for key, value in pairs(default_opts) do
        merged_opts[key] = user_opts[key] ~= nil and user_opts[key] or value
    end

    return merged_opts
end

--- @param config nvimine.config
M.setup = function(config)
    if M.initialized then
        vim.api.nvim_echo({ { "Nvimine is already initialized.", "WarningMsg" } }, true, {})
        return
    end

    local default_config = require("nvimine.default_config")
    default_config.set_config(config)

    M.load_lsp_servers()

    M.initialized = true
end

M.load_lsp_servers = function()
    local config = require("nvimine.default_config").get_config()
    local default_lsp_servers = require("nvimine.default_config").default_lsp_servers

    if config.lsp_servers == false then
        return
    end

    require("nvimine.lsp_servers.all")

    local required_servers = (config.lsp_servers == true) and default_lsp_servers or config.lsp_servers

    if type(required_servers) ~= "table" then
        vim.api.nvim_echo(
            { { "Invalid LSP servers configuration. Expected a table, got " .. type(required_servers), "ErrorMsg" } },
            true,
            {})
        return
    end

    for server, serverConfig in pairs(required_servers) do
        if serverConfig.enabled then
            local ok, result = pcall(require, "nvimine.lsp_servers." .. server)
            if not ok then
                vim.api.nvim_echo({ { "Failed to enable LSP server: " .. server, "ErrorMsg" } }, true, {})
                -- print error
                vim.api.nvim_echo({ { result, "ErrorMsg" } }, true, {})
            end
        end
    end
end

M.get_plugin_config = function(plugin_name)
    -- If setup hasn't been called yet, use defaults
    -- This allows lazy's import to work before config function runs
    local default_config_module = require("nvimine.default_config")
    local config = default_config_module.config or default_config_module.default_config
    local default_plugins = default_config_module.default_plugins

    if not config or config.plugins == false then
        return nil, false
    end

    local required_plugins = (config.plugins == true) and default_plugins or config.plugins

    if type(required_plugins) ~= "table" then
        return nil, false
    end

    local plugin_config = required_plugins[plugin_name]
    if not plugin_config.enabled then
        return nil, false
    end

    -- Try to load config file, fall back to empty table if doesn't exist
    local ok, plugin_default_opts = pcall(require, "nvimine.configs." .. plugin_name)
    if not ok then
        plugin_default_opts = {}
    end

    local plugin_opts = plugin_config.config or {}

    local merged_opts = merge_plugin_opts(plugin_default_opts, plugin_opts)

    return merged_opts, true
end

return M
