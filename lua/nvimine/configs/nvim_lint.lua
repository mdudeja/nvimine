local eslint_configs = {
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.json",
  ".eslintrc.yml",
  ".eslintrc.yaml",
}

return {
  -- Names double as Mason package names (installed by mason-tool-installer)
  linters_by_ft = {
    python = { "ruff" },
    javascript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    sh = { "shellcheck" },
    bash = { "shellcheck" },
    dockerfile = { "hadolint" },
  },
  -- A linter only runs when its condition passes for the buffer
  conditions = {
    eslint_d = function(bufnr)
      return vim.fs.root(bufnr, eslint_configs) ~= nil
    end,
  },
  events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  debounce_ms = 100,
}
