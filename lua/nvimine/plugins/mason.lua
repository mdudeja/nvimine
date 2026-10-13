local merged_opts, enabled = require("nvimine").get_plugin_config("mason")

if not enabled then
    return
end

return {
    "williamboman/mason.nvim",
    version = "^2.3",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = merged_opts,
}
