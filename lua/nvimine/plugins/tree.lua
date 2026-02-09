local merged_opts, enabled = require("nvimine").get_plugin_config("tree")

if not enabled then
    return
end

return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeFindFileToggle" },
    opts = merged_opts,
}
