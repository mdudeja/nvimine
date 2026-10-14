local merged_opts, enabled = require("nvimine").get_plugin_config "grug_far"

if not enabled then
  return
end

-- Prefill the files filter with the current buffer's extension
local function ext_filter()
  local ext = vim.bo.buftype == "" and vim.fn.expand "%:e" or ""
  return ext ~= "" and "*." .. ext or nil
end

return {
  "MagicDuck/grug-far.nvim",
  commit = "11595bf747edc270bce2069d1020502ad4ae56cf",
  cmd = { "GrugFar", "GrugFarWithin" },
  opts = merged_opts or {},
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open { prefills = { filesFilter = ext_filter() } }
      end,
      desc = "Search and Replace (project)",
    },
    {
      "<leader>sr",
      function()
        require("grug-far").with_visual_selection { prefills = { filesFilter = ext_filter() } }
      end,
      mode = "x",
      desc = "Search and Replace selection (project)",
    },
    {
      "<leader>sf",
      function()
        require("grug-far").open { prefills = { paths = vim.fn.expand "%" } }
      end,
      desc = "Search and Replace (current file)",
    },
  },
}
