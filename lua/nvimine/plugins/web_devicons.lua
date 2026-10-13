local merged_opts, enabled = require("nvimine").get_plugin_config("web_devicons")

if not enabled then
    return
end

return {
    "nvim-tree/nvim-web-devicons",
    commit = "58447c1fca354bbf184425e4a8d01deecbd6f3c4",
    opts = merged_opts or {},
}
