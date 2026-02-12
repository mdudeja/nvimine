local merged_opts, enabled = require("nvimine").get_plugin_config("blink_cmp")

if not enabled then
    return
end

local luaSnipDep = {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
        history = true,
        updateevents = "TextChanged,TextChangedI",
    },
    config = function(_, opts)
        require("luasnip").setup(opts)

        -- vscode format
        require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
        require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

        -- snipmate format
        require("luasnip.loaders.from_snipmate").load()
        require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

        -- lua format
        require("luasnip.loaders.from_lua").load()
        require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }
    end,
}

return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    build = 'cargo build --release',
    dependencies = luaSnipDep,
    opts = merged_opts,
    opts_extend = { "sources.default" }
}
