local merged_opts, enabled = require("nvimine").get_plugin_config("indent_blankline")

if not enabled then
    return
end

return {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = merged_opts or {},
}
