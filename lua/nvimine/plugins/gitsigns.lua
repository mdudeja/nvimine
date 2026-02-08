local merged_opts, enabled = require("nvimine").get_plugin_config("gitsigns")

if not enabled then
    return
end

return {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = merged_opts,
}
