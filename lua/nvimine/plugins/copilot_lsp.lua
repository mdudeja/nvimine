local _, enabled = require("nvimine").get_plugin_config("copilot_lsp")

if not enabled then
    return
end

return {
    "copilotlsp-nvim/copilot-lsp",
    commit = "1b6d8273594643f51bb4c0c1d819bdb21b42159d",
    event = "InsertEnter",
    init = function()
        vim.g.copilot_nes_debounce = 500

        -- Tab in normal mode: jump to a pending NES, then apply it; otherwise <C-i>
        vim.keymap.set("n", "<tab>", function()
            local bufnr = vim.api.nvim_get_current_buf()
            local state = vim.b[bufnr].nes_state
            if state then
                local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
                    or (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
                return nil
            else
                return "<C-i>"
            end
        end, { desc = "Accept Copilot NES suggestion", expr = true })
    end,
}
