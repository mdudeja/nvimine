local merged_opts, enabled = require("nvimine").get_plugin_config("auto_session")

if not enabled then
    return
end

return {
    "rmagatti/auto-session",
    lazy = false,
    opts = merged_opts or {},
}
