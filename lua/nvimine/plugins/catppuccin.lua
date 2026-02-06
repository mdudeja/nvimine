local merged_opts, enabled = require("nvimine").get_plugin_config("catppuccin")

if not enabled then
    return {}
end

local default_opts = {
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = true,
}

local final_opts = vim.tbl_deep_extend("force", default_opts, merged_opts or {})

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = final_opts,
}
