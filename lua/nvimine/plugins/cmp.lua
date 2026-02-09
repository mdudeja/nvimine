local merged_opts, enabled = require("nvimine").get_plugin_config("cmp")

if not enabled then
    return
end

local luaSnipDep = {
    "L3MON4D3/LuaSnip",
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

local autoPairsDep = {
    "windwp/nvim-autopairs",
    opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input", "vim" },
        check_ts = true,

    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}

local other_sources = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "https://codeberg.org/FelipeLema/cmp-async-path.git",
}

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = vim.list_extend({ luaSnipDep, autoPairsDep }, other_sources),
    opts = {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        merged_opts,
    },
}
