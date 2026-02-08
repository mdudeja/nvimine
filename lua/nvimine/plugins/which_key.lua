local merged_opts, enabled = require("nvimine").get_plugin_config("which_key")

if not enabled then
    return
end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = merged_opts or {},
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
