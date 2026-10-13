local merged_opts, enabled = require("nvimine").get_plugin_config("auto_session")

if not enabled then
    return
end

return {
    "rmagatti/auto-session",
    commit = "02a5588f677970a9bc784115c62bef9e5855499b",
    lazy = false,
    opts = merged_opts or {},
}
