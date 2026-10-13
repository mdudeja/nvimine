local _, enabled = require("nvimine").get_plugin_config("treesitter")

if not enabled then
    return
end

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    commit = "1a4f47b03dfe92d28de7d5654c67327ef008c9e6",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate | TSInstallAll",
}
