local get_plugin_dir = function(plugin_name)
    local all_plugins = require("lazy").plugins()

    if type(all_plugins) ~= "table" then
        return
    end

    local entry = unpack(
        vim.tbl_filter(function(entry)
            return entry.name == plugin_name
        end, all_plugins)
    )

    if not entry then
        return
    end

    return entry.dir
end

local function getSettings()
    local settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                    'types/?/?.lua'
                }
            },
            workspace = {
                library = {
                    vim.fn.expand "$VIMRUNTIME/lua",
                    vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                    vim.fn.expand "~/.luarocks/share/lua/5.4",
                    get_plugin_dir("nvimine"),
                    get_plugin_dir("snacks.nvim"),
                    "${3rd}/luv/library",
                },
            },
            codeLens = { enable = true },
            hint = { enable = true, semicolon = 'Disable' },
        },
    }

    return settings
end

local on_attach = require("nvimine.lsp_servers.mapOverridesOnAttach")("lua")
local capabilities = require("nvimine.lsp_servers.serverCapabilities")

vim.lsp.config("lua-language-server", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git" },
    settings = getSettings(),
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable("lua-language-server")
