local group = vim.api.nvim_create_augroup("NvimineAutoCmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { '<filetype>' },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
    group = group,
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        local bufType = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

        if not vim.g.ui_entered and args.event == "UIEnter" then
            vim.g.ui_entered = true
        end

        if file ~= "" and bufType ~= "nofile" and vim.g.ui_entered then
            vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })

            vim.schedule(function()
                vim.api.nvim_exec_autocmds("FileType", {})

                if vim.g.editorconfig then
                    require("editorconfig").config(args.buf)
                end
            end)
        end
    end,
})

vim.api.nvim_create_user_command("TSInstallAll", function()
    local options, enabled = require("nvimine").get_plugin_config("treesitter")

    if not enabled or not options then
        return
    end

    if type(options.ensure_installed) ~= "table" then
        return
    end

    local parsers = options.ensure_installed

    require("nvim-treesitter").install(parsers)
end, {})
