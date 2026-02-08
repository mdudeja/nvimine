local function get_formatters_from_conform()
    local conform_opts, conform_enabled = require("nvimine").get_plugin_config("conform")

    if not conform_enabled or not conform_opts or not conform_opts.formatters_by_ft then
        return {}
    end

    local formatters = {}
    local seen = {}

    for _, formatter_list in pairs(conform_opts.formatters_by_ft) do
        if type(formatter_list) == "table" then
            for _, formatter in ipairs(formatter_list) do
                if type(formatter) == "string" and not seen[formatter] then
                    -- rustfmt is deprecated and we'll use the local rustfmt instead
                    if formatter ~= "rustfmt" then
                        seen[formatter] = true
                        table.insert(formatters, formatter)
                    end
                end
            end
        end
    end

    vim.api.nvim_echo({ { "Formatters to install: " .. table.concat(formatters, ", "), "InfoMsg" } }, true, {})

    return formatters
end

-- Get LSP servers from config
local function get_enabled_lsp_servers()
    local config = require("nvimine.default_config").get_config()
    local default_lsp_servers = require("nvimine.default_config").default_lsp_servers

    if config.lsp_servers == false then
        return {}
    end

    local required_servers = (config.lsp_servers == true) and default_lsp_servers or config.lsp_servers

    if type(required_servers) ~= "table" then
        return {}
    end

    local servers = {}
    for server, serverConfig in pairs(required_servers) do
        if serverConfig.enabled then
            table.insert(servers, serverConfig.mason_name)
        end
    end

    return servers
end

-- Combine LSP servers and formatters
local function get_tools_to_install()
    local tools = {}

    -- Add LSP servers
    for _, server in ipairs(get_enabled_lsp_servers()) do
        table.insert(tools, server)
    end

    -- Add formatters
    for _, formatter in ipairs(get_formatters_from_conform()) do
        table.insert(tools, formatter)
    end

    return tools
end

local default_opts = {
    -- Dynamically build list from config
    ensure_installed = get_tools_to_install(),

    -- Auto-update installed tools
    auto_update = false,
}

return default_opts
