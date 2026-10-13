local merged_opts, enabled = require("nvimine").get_plugin_config("lualine")

if not enabled then
    return
end

return {
    "nvim-lualine/lualine.nvim",
    commit = "221ce6b2d999187044529f49da6554a92f740a96",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = merged_opts,
    config = function(_, opts)
        require("lualine").setup(opts)
    end,
}
