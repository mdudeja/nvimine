local merged_opts, enabled = require("nvimine").get_plugin_config "dap"

if not enabled then
  return
end

local function mason_path(...)
  return table.concat({ vim.fn.stdpath "data", "mason", ... }, "/")
end

local function setup_adapters(dap)
  -- Python: dap-python ships launch configs (file, file with args, attach...)
  local debugpy_python = mason_path("packages", "debugpy", "venv", "bin", "python")
  if vim.fn.executable(debugpy_python) == 1 then
    require("dap-python").setup(debugpy_python)
  end

  -- Rust / C / C++
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = { command = "codelldb", args = { "--port", "${port}" } },
  }
  for _, ft in ipairs { "rust", "c", "cpp" } do
    dap.configurations[ft] = dap.configurations[ft]
      or {
        {
          name = "Launch executable",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
  end

  -- JavaScript / TypeScript (node)
  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = { command = "js-debug-adapter", args = { "${port}" } },
  }
  for _, ft in ipairs { "javascript", "typescript", "javascriptreact", "typescriptreact" } do
    dap.configurations[ft] = dap.configurations[ft]
      or {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch current file (node)",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to process",
          processId = function()
            return require("dap.utils").pick_process()
          end,
          cwd = "${workspaceFolder}",
        },
      }
  end
end

local function dap_call(method, ...)
  local args = { ... }
  return function()
    require("dap")[method](unpack(args))
  end
end

return {
  "mfussenegger/nvim-dap",
  commit = "cfa2d58f4537aca6ca83e2de1a0d9f1491121264",
  dependencies = {
    { "igorlfs/nvim-dap-view", commit = "e766b3d8acef97e7e8b29f7f421aa4977b9978e1" },
    { "theHamsta/nvim-dap-virtual-text", commit = "fbdb48c2ed45f4a8293d0d483f7730d24467ccb6" },
    { "mfussenegger/nvim-dap-python", commit = "1808458eba2b18f178f990e01376941a42c7f93b" },
  },
  opts = merged_opts or {},
  keys = {
    { "<leader>db", dap_call "toggle_breakpoint", desc = "Toggle Breakpoint" },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "Conditional Breakpoint",
    },
    {
      "<leader>dL",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input "Log message: ")
      end,
      desc = "Logpoint",
    },
    { "<leader>dc", dap_call "continue", desc = "Run / Continue" },
    { "<leader>dC", dap_call "run_to_cursor", desc = "Run to Cursor" },
    { "<leader>dl", dap_call "run_last", desc = "Run Last" },
    { "<leader>di", dap_call "step_into", desc = "Step Into" },
    { "<leader>do", dap_call "step_over", desc = "Step Over" },
    { "<leader>dO", dap_call "step_out", desc = "Step Out" },
    { "<leader>dj", dap_call "down", desc = "Down (stack frame)" },
    { "<leader>dk", dap_call "up", desc = "Up (stack frame)" },
    { "<leader>dp", dap_call "pause", desc = "Pause" },
    { "<leader>dt", dap_call "terminate", desc = "Terminate" },
    { "<leader>dx", dap_call "clear_breakpoints", desc = "Clear All Breakpoints" },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
    {
      "<leader>du",
      function()
        require("dap-view").toggle()
      end,
      desc = "Toggle Debug View",
    },
    {
      "<leader>de",
      function()
        require("dap.ui.widgets").hover()
      end,
      mode = { "n", "x" },
      desc = "Evaluate Expression",
    },
    { "<F5>", dap_call "continue", desc = "Debug: Continue" },
    { "<F9>", dap_call "toggle_breakpoint", desc = "Debug: Toggle Breakpoint" },
    { "<F10>", dap_call "step_over", desc = "Debug: Step Over" },
    { "<F11>", dap_call "step_into", desc = "Debug: Step Into" },
    { "<F12>", dap_call "step_out", desc = "Debug: Step Out" },
  },
  config = function(_, opts)
    local dap = require "dap"

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    local signs = {
      DapBreakpoint = { "", "DiagnosticError" },
      DapBreakpointCondition = { "", "DiagnosticWarn" },
      DapLogPoint = { "", "DiagnosticInfo" },
      DapStopped = { "󰁕", "DiagnosticWarn", "DapStoppedLine" },
      DapBreakpointRejected = { "", "DiagnosticError" },
    }
    for name, sign in pairs(signs) do
      vim.fn.sign_define(name, { text = sign[1], texthl = sign[2], linehl = sign[3], numhl = sign[3] })
    end

    require("dap-view").setup {}
    if opts.virtual_text and opts.virtual_text.enabled ~= false then
      require("nvim-dap-virtual-text").setup {}
    end

    if opts.auto_open_view ~= false then
      local view = require "dap-view"
      dap.listeners.before.attach.nvimine_view = function()
        view.open()
      end
      dap.listeners.before.launch.nvimine_view = function()
        view.open()
      end
      dap.listeners.before.event_terminated.nvimine_view = function()
        view.close()
      end
      dap.listeners.before.event_exited.nvimine_view = function()
        view.close()
      end
    end

    setup_adapters(dap)
  end,
}
