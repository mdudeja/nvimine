local merged_opts, enabled = require("nvimine").get_plugin_config("which_key")

if not enabled then
    return
end

return {
    "folke/which-key.nvim",
    -- Load at startup, not on first keypress: setup() finishes asynchronously,
    -- so a key that both loads and calls show() runs before it's ready.
    event = "VeryLazy",
    opts = merged_opts or {},
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "which-key: Buffer local keymaps",
        },
        {
            "<leader>ww",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "which-key: All keymaps",
        }
    }
}
