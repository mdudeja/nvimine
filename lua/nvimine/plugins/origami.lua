local merged_opts, enabled = require("nvimine").get_plugin_config "origami"

if not enabled then
  return
end

return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = merged_opts,
}
