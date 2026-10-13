local merged_opts, enabled = require("nvimine").get_plugin_config "origami"

if not enabled then
  return
end

return {
  "chrisgrieser/nvim-origami",
  commit = "a137d35eaabb7cd7be89228229c1aa5b057f5ed7",
  event = "VeryLazy",
  opts = merged_opts,
}
