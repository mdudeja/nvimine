return {
    triggers = {
        { "<auto>", mode = "nixsotc" },
    },
    spec = {
        { "<leader>l", group = "lsp" },
        { "<leader>la", group = "calls" },
        { "<leader>lw", group = "workspace folders" },
        { "<leader>h", group = "git hunks" },
        { "<leader>t", group = "terminal/tab/toggles" },
        { "<leader>b", group = "buffers" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui toggles" },
        { "<leader>x", group = "diagnostics/quickfix (trouble)" },
    },
}
