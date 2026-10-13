local merged_opts, enabled = require("nvimine").get_plugin_config("conform")

if not enabled then
    return
end

return {
    "stevearc/conform.nvim",
    commit = "016802de402556da54c36bd7359b441266b01cdd",
    opts = merged_opts,
    event = "User FilePost"
}
