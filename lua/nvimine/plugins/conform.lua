local merged_opts, enabled = require("nvimine").get_plugin_config("conform")

if not enabled then
    return
end

return {
    "stevearc/conform.nvim",
    opts = merged_opts,
    event = "User FilePost"
}
