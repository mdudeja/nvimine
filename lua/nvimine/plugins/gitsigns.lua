local merged_opts, enabled = require("nvimine").get_plugin_config("gitsigns")

if not enabled then
    return {}
end

local default_opts = {
    signs = {
        delete = { text = "󰍵" },
        changedelete = { text = "󱕖" },
    },
}

local final_opts = vim.tbl_deep_extend("force", default_opts, merged_opts or {})

return {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = final_opts,
}
