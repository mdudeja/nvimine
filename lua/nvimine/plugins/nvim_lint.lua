local merged_opts, enabled = require("nvimine").get_plugin_config "nvim_lint"

if not enabled then
  return
end

return {
  "mfussenegger/nvim-lint",
  commit = "f6230a5c06ba59e6059c14637f1dbe29a7978b9b",
  event = "User FilePost",
  opts = merged_opts or {},
  config = function(_, opts)
    local lint = require "lint"
    lint.linters_by_ft = opts.linters_by_ft or {}

    local conditions = opts.conditions or {}

    local function try_lint()
      local bufnr = vim.api.nvim_get_current_buf()
      local names = vim.tbl_filter(function(name)
        local condition = conditions[name]
        return not condition or condition(bufnr)
      end, lint._resolve_linter_by_ft(vim.bo[bufnr].filetype))

      if #names > 0 then
        lint.try_lint(names)
      end
    end

    local timer = assert(vim.uv.new_timer())
    vim.api.nvim_create_autocmd(opts.events, {
      group = vim.api.nvim_create_augroup("nvimine_lint", { clear = true }),
      callback = function()
        timer:start(opts.debounce_ms or 100, 0, vim.schedule_wrap(try_lint))
      end,
    })

    vim.keymap.set("n", "<leader>cl", try_lint, { desc = "Lint buffer" })

    -- The buffer that triggered loading was already read
    try_lint()
  end,
}
