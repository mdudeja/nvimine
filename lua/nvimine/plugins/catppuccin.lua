local merged_opts, enabled = require("nvimine").get_plugin_config("catppuccin")

if not enabled then
    return
end

return {
    "catppuccin/nvim",
    commit = "edefef779ab08ce1a4a404713e3012b0d202bd35",
    name = "catppuccin",
    lazy = false,
    opts = merged_opts,
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme "catppuccin"
    end,
}
