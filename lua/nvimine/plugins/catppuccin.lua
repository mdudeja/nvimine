local merged_opts, enabled = require("nvimine").get_plugin_config("catppuccin")

if not enabled then
    return
end

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = merged_opts,
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme "catppuccin"
    end,
}
