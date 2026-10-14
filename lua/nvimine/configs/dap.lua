return {
  -- Mason packages for the debug adapters (installed by mason-tool-installer)
  -- debugpy: Python · codelldb: Rust/C/C++ · js-debug-adapter: JS/TS (node)
  adapters = { "debugpy", "codelldb", "js-debug-adapter" },
  -- Open the dap-view panel when a session starts, close it when it ends
  auto_open_view = true,
  virtual_text = {
    enabled = true,
  },
}
