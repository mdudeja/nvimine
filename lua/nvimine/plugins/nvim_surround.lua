local merged_opts, enabled = require("nvimine").get_plugin_config("nvim_surround")

if not enabled then
  return
end

return {
  "kylechui/nvim-surround",
  version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  opts = merged_opts or {},
  config = function(_, opts)
    require("nvim-surround").setup(opts)
  end,
}
