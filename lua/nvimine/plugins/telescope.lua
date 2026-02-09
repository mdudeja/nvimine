local merged_opts, enabled = require("nvimine").get_plugin_config("telescope")

if not enabled then
    return
end

return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    opts = merged_opts,
}
