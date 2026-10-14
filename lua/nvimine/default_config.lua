local M = {}

---@type nvimine.config?
M.config = nil

---@type nvimine.config.lsp_servers
M.default_lsp_servers = {
  lua_ls = { enabled = true, mason_name = "lua-language-server" },
  rust_analyzer = { enabled = true, mason_name = "rust-analyzer" },
  pyright = { enabled = true, mason_name = "pyright" },
  ts_ls = { enabled = true, mason_name = "typescript-language-server" },
  copilot_ls = { enabled = true, mason_name = "copilot-language-server" },
  jsonls = { enabled = true, mason_name = "json-lsp" },
  yamlls = { enabled = true, mason_name = "yaml-language-server" },
}

---@type nvimine.config.plugins
M.default_plugins = {
  blinkcmp = { enabled = true },
  blink_pairs = { enabled = true },
  copilot_lsp = { enabled = true },
  catppuccin = { enabled = true },
  conform = { enabled = true },
  lspconfig = { enabled = true },
  web_devicons = { enabled = true },
  mason = { enabled = true },
  mason_tool_installer = { enabled = true },
  nvim_surround = { enabled = true },
  treesitter = { enabled = true },
  snacks = { enabled = true },
  which_key = { enabled = true },
  auto_session = { enabled = false },
  edgy = { enabled = true },
  origami = { enabled = true },
  lualine = { enabled = true },
  flash = { enabled = true },
  gitsigns = { enabled = true },
  mini_ai = { enabled = true },
  trouble = { enabled = true },
  nvim_lint = { enabled = true },
  grug_far = { enabled = true },
  dap = { enabled = true },
  diffview = { enabled = true },
  todo_comments = { enabled = true },
  guess_indent = { enabled = true },
  ts_autotag = { enabled = true },
  schemastore = { enabled = true },
}

---@type nvimine.config
M.default_config = {
  enabled = true,
  lsp_servers = M.default_lsp_servers,
  plugins = M.default_plugins,
  diagnostics = true,
}

M.set_config = function(config)
  M.config = vim.tbl_deep_extend("force", M.default_config, config or {})
end

M.clear_config = function()
  M.config = nil
end

M.get_config = function()
  return M.config or M.default_config
end

return M
