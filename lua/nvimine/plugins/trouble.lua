local merged_opts, enabled = require("nvimine").get_plugin_config "trouble"

if not enabled then
  return
end

return {
  {
    "folke/trouble.nvim",
    commit = "bd67efe408d4816e25e8491cc5ad4088e708a69a",
    cmd = "Trouble",
    opts = merged_opts or {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / References (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
  {
    -- <a-t> in any snacks picker sends the results to Trouble
    "mdudeja/snacks.nvim",
    optional = true,
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          actions = {
            trouble_open = function(...)
              return require("trouble.sources.snacks").actions.trouble_open.action(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-t>"] = { "trouble_open", mode = { "n", "i" } },
              },
            },
          },
        },
      })
    end,
  },
}
