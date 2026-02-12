return {
    snippets = { preset = "luasnip" },
    keymap = {
        preset = "default"
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    },
    completion = {
        keyword = {
            range = 'full'
        },
        ghost_text = {
            enabled = true
        }
    },
    signature = {
        enabled = true,
        -- trigger = {
        --     enabled = false
        -- }
    }
}
