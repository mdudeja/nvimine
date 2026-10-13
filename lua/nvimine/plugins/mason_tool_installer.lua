local merged_opts, enabled = require("nvimine").get_plugin_config("mason_tool_installer")

if not enabled then
    return
end


return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    commit = "443f1ef8b5e6bf47045cb2217b6f748a223cf7dc",
    dependencies = {
        "williamboman/mason.nvim",
    },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    opts = merged_opts,
}
