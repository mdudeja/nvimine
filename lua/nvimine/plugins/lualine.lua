local merged_opts, enabled = require("nvimine").get_plugin_config("lualine")

if not enabled then
    return
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = merged_opts,
    config = function(_, opts)
        require("lualine").setup(opts)
    end,
}
