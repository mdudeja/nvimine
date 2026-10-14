local merged_opts, enabled = require("nvimine").get_plugin_config "guess_indent"

if not enabled then
  return
end

return {
  "NMAC427/guess-indent.nvim",
  commit = "84a4987ff36798c2fc1169cbaff67960aed9776f",
  event = { "BufReadPre", "BufNewFile" },
  opts = merged_opts or {},
}
