local merged_opts, enabled = require("nvimine").get_plugin_config "diffview"

if not enabled then
  return
end

return {
  "sindrets/diffview.nvim",
  commit = "4516612fe98ff56ae0415a259ff6361a89419b0a",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  opts = merged_opts or {},
  keys = {
    {
      "<leader>gv",
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd "DiffviewOpen"
        else
          vim.cmd "DiffviewClose"
        end
      end,
      desc = "Diffview: Toggle working tree diff",
    },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File history" },
    { "<leader>gh", ":DiffviewFileHistory<cr>", mode = "x", desc = "Diffview: Selection history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: Repo history" },
  },
}
