---@meta

---@class nvimine.config.lsp_config
---@field enabled boolean
---@field mason_name string

---@class nvimine.config.lsp_servers
---@field lua_ls nvimine.config.lsp_config?
---@field rust_analyzer nvimine.config.lsp_config?
---@field pyright nvimine.config.lsp_config?
---@field ts_ls nvimine.config.lsp_config?

---@class nvimine.config.plugin_config
---@field enabled boolean

---@class nvimine.config.plugins
---@field catppuccin nvimine.config.plugin_config?
---@field conform nvimine.config.plugin_config?
---@field indent_blankline nvimine.config.plugin_config?
---@field lspconfig nvimine.config.plugin_config?
---@field nvim_tree nvimine.config.plugin_config?
---@field nvim_web_devicons nvimine.config.plugin_config?
---@field which_key nvimine.config.plugin_config?
---@field gitsigns nvimine.config.plugin_config?
---@field mason nvimine.config.plugin_config?
---@field mason_tool_installer nvimine.config.plugin_config?
---@field nvim_cmp nvimine.config.plugin_config?
---@field treesitter nvimine.config.plugin_config?
---@field telescope nvimine.config.plugin_config?

---@class nvimine.config
--- Enables or disables nvimine. If disabled, nvimine will not do anything.
---@field enabled boolean?
--- Enabled LSP servers. If false, nvimine will not enable any LSP servers. If true, nvimine will enable all LSP servers. If a table, nvimine will enable the LSP servers in the table.
---@field lsp_servers boolean|nvimine.config.lsp_servers?
--- Enabled Plugins. If false, nvimine will not enable any plugins. If true, nvimine will enable all plugins. If a table, nvimine will enable the plugins in the table.
---@field plugins boolean|nvimine.config.plugins?
--- Enabled Diagnostics. If false, nvimine will not enable diagnostics. If true, nvimine will enable diagnostics. If a table, nvimine will enable the diagnostics in the table.
---@field diagnostics boolean|table<string, boolean>?
