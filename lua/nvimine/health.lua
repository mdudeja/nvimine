local M = {}

M.check = function()
  local version = require("nvimine.version")

  vim.health.start("nvimine")
  vim.health.info("Version: " .. version.string)

  if vim.fn.has("nvim-" .. version.min_nvim) == 1 then
    vim.health.ok("Neovim " .. tostring(vim.version()) .. " >= " .. version.min_nvim)
  else
    vim.health.error("Neovim " .. version.min_nvim .. "+ is required, found " .. tostring(vim.version()))
  end

  local has_snacks, snacks = pcall(require, "snacks")
  if has_snacks then
    -- rawget: Snacks' __index would otherwise try to require("snacks.fork_version")
    local fork_version = rawget(snacks, "fork_version")
    vim.health.info("snacks.nvim: " .. (fork_version or (tostring(snacks.version) .. " (upstream)")))
  end

  if require("nvimine").initialized then
    vim.health.ok("setup() has been called")
  else
    vim.health.warn("setup() has not been called")
  end
end

return M
