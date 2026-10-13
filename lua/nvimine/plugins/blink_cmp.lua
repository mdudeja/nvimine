local merged_opts, enabled = require("nvimine").get_plugin_config("blinkcmp")

if not enabled then
    return
end

return {
    'saghen/blink.cmp',
    version = '1.*',
    lazy = false,
    dependencies = {
        { "fang2hou/blink-copilot", commit = "7ad8209b2f880a2840c94cdcd80ab4dc511d4f39" },
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = "make install_jsregexp",
            dependencies = { "rafamadriz/friendly-snippets", commit = "b4d01b0fdf3c9a549961c2f9ffe8dc09be166219" },
            opts = {
                history = true,
                updateevents = "TextChanged,TextChangedI",
            },
            config = function(_, opts)
                require("luasnip").setup(opts)

                -- vscode format
                require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
                require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

                -- snipmate format
                require("luasnip.loaders.from_snipmate").load()
                require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

                -- lua format
                require("luasnip.loaders.from_lua").load()
                require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })
            end,
        },
    },
    opts = merged_opts or {},
    opts_extend = { "sources.default" }
}
