local merged_opts, enabled = require("nvimine").get_plugin_config "todo_comments"

if not enabled then
  return
end

local strong = { "TODO", "FIX", "FIXME" }

return {
  "folke/todo-comments.nvim",
  commit = "31e3c38ce9b29781e4422fc0322eb0a21f4e8668",
  event = "User FilePost",
  cmd = { "TodoTrouble", "TodoQuickFix", "TodoLocList" },
  dependencies = { { "nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b" } },
  opts = merged_opts or {},
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment",
    },
    {
      "<leader>st",
      function()
        Snacks.picker.todo_comments()
      end,
      desc = "Search Todo Comments",
    },
    {
      "<leader>sT",
      function()
        Snacks.picker.todo_comments { keywords = strong }
      end,
      desc = "Search Todo/Fix/Fixme",
    },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    {
      "<leader>xT",
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
      desc = "Todo/Fix/Fixme (Trouble)",
    },
  },
}
