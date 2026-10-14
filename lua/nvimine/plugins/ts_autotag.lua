local merged_opts, enabled = require("nvimine").get_plugin_config "ts_autotag"

if not enabled then
  return
end

return {
  "windwp/nvim-ts-autotag",
  commit = "d7220b55e16ed3c04e88086256def5d282429493",
  event = "User FilePost",
  opts = merged_opts or {},
}
