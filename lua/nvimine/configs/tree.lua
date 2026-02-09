return {
    filters = {
        custom = function(path)
            local without_trailing = path:gsub("/$", "")
            local name = without_trailing:match("^.+/(.+)$")

            return name == ".git"
        end,
    },
    disable_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    sort = {
        sorter = 'case_sensitive',
    },
    view = {
        width = 30,
    },
    renderer = {
        root_folder_label = false,
        group_empty = true,
        highlight_git = 'all',
        highlight_hidden = "all",
        indent_markers = { enable = true },
        icons = {
            git_placement = "signcolumn",
            web_devicons = {
                folder = {
                    enable = true,
                }
            },
            show = {
                hidden = true,
            },
            glyphs = {
                default = "󰈚",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                },
                git = { unmerged = "" },
            },
        },
    },
}
