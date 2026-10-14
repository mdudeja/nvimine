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

-- Linters from nvim-lint (names match Mason package names)
local function get_linters_from_nvim_lint()
    local lint_opts, lint_enabled = require("nvimine").get_plugin_config("nvim_lint")

    if not lint_enabled or not lint_opts or type(lint_opts.linters_by_ft) ~= "table" then
        return {}
    end

    local linters = {}
    for _, linter_list in pairs(lint_opts.linters_by_ft) do
        for _, linter in ipairs(linter_list) do
            table.insert(linters, linter)
        end
    end

    return linters
end

-- Debug adapters for nvim-dap
local function get_dap_adapters()
    local dap_opts, dap_enabled = require("nvimine").get_plugin_config("dap")

    if not dap_enabled or not dap_opts or type(dap_opts.adapters) ~= "table" then
        return {}
    end

    return dap_opts.adapters
end

-- Combine LSP servers, formatters, linters and debug adapters
local function get_tools_to_install()
    local tools = {}
    local seen = {}

    local function add(tool)
        if not seen[tool] then
            seen[tool] = true
            table.insert(tools, tool)
        end
    end

    for _, server in ipairs(get_enabled_lsp_servers()) do
        add(server)
    end

    for _, formatter in ipairs(get_formatters_from_conform()) do
        add(formatter)
    end

    for _, linter in ipairs(get_linters_from_nvim_lint()) do
        add(linter)
    end

    for _, adapter in ipairs(get_dap_adapters()) do
        add(adapter)
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
