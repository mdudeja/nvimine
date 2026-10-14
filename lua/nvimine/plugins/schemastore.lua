local _, enabled = require("nvimine").get_plugin_config "schemastore"

if not enabled then
  return
end

-- Loaded on require by the jsonls / yamlls server configs
return {
  "b0o/SchemaStore.nvim",
  lazy = true,
  -- Unpinned: it is a schema catalog that is meant to track upstream
  version = false,
}
