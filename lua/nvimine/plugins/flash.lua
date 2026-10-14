local merged_opts, enabled = require("nvimine").get_plugin_config("flash")

if not enabled then
    return
end

return {
    "folke/flash.nvim",
    commit = "5f0f270fdc7c5b0c21d903ee85b9cb06f2ac636a",
    event = "VeryLazy",
    opts = merged_opts,
    keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        -- Visual S belongs to nvim-surround
        { "S",     mode = { "n", "o" },      function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
}
