return {
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = "diff3_mixed",
    },
  },
  -- `q` closes Diffview from any of its windows
  keymaps = {
    view = { { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } } },
    file_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } } },
    file_history_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } } },
  },
}
