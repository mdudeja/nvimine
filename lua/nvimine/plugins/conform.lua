local merged_opts, enabled = require("nvimine").get_plugin_config("conform")

if not enabled then
    return {}
end

local default_opts = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        python = { "ruff_format", "black", stop_after_first = true },
        rust = { "rustfmt", "black", stop_after_first = true },
    },
    format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true
    }
}

local final_opts = vim.tbl_deep_extend("force", default_opts, merged_opts or {})

return {
    "stevearc/conform.nvim",
    opts = final_opts,
}
