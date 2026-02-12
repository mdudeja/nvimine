local merged_opts, enabled = require("nvimine").get_plugin_config("which_key")

if not enabled then
    return
end

return {
    "folke/which-key.nvim",
    opts = merged_opts or {},
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            { desc = "which-key: Buffer local keymaps" },
        },
        {
            "<leader>ww",
            function()
                require("which-key").show({ global = true })
            end,
            { desc = "which-key: All keymaps" },
        }
    }
}
