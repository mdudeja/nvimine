local merged_opts, enabled = require("nvimine").get_plugin_config("blinkcmp")

if not enabled then
    return
end

return {
    'saghen/blink.cmp',
    version = '1.*',
    lazy = false,
    opts = merged_opts or {},
    opts_extend = { "sources.default" }
}
