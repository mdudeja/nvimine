local merged_opts, enabled = require("nvimine").get_plugin_config("mason_tool_installer")

if not enabled then
    return
end


return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    opts = merged_opts,
}
