local merged_opts, enabled = require("nvimine").get_plugin_config("nvim_web_devicons")

if not enabled then
    return
end

return {
    "nvim-tree/nvim-web-devicons",
    opts = merged_opts or {},
}
