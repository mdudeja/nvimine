local _, enabled = require("nvimine").get_plugin_config("lspconfig")

if not enabled then
    return
end

return {
    "neovim/nvim-lspconfig",
    event = "User FilePost"
}
