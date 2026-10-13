local merged_opts, enabled = require("nvimine").get_plugin_config("blink_pairs")

if not enabled then
    return
end

return {
    "saghen/blink.pairs",
    commit = "ef8fc29c8afa0fc1d0eb611a1a76fd87f0951f6e",
    event = "User FilePost",
    build = function()
        require("blink.pairs").build():pwait(60000)
    end,
    dependencies = {
        { "saghen/blink.lib", commit = "fd9a48ebbe6ec30d5dfcc5b42c243941ccdca1aa" },
    },
    opts = merged_opts or {},
}
