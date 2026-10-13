local _, enabled = require("nvimine").get_plugin_config("lspconfig")

if not enabled then
    return
end

return {
    "neovim/nvim-lspconfig",
    commit = "c59fc922f718fa055f69f5f3bc888f23211571eb",
    event = "User FilePost"
}
