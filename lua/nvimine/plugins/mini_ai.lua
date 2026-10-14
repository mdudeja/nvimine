local merged_opts, enabled = require("nvimine").get_plugin_config "mini_ai"

if not enabled then
  return
end

return {
  "nvim-mini/mini.ai",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    -- Only its textobject queries are used (by mini.ai's treesitter specs)
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main", commit = "5c7b0263797dfd1bd6202f2b219f3b53a80b2187" },
  },
  opts = merged_opts or {},
  config = function(_, opts)
    local ai = require "mini.ai"

    opts.custom_textobjects = vim.tbl_extend("keep", opts.custom_textobjects or {}, {
      -- af/if: function definition, ac/ic: class, ao/io: block/conditional/loop
      f = ai.gen_spec.treesitter { a = "@function.outer", i = "@function.inner" },
      c = ai.gen_spec.treesitter { a = "@class.outer", i = "@class.inner" },
      o = ai.gen_spec.treesitter {
        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
      },
      -- au/iu: function call (mini.ai's default `f`), aU/iU: call without dots in the name
      u = ai.gen_spec.function_call(),
      U = ai.gen_spec.function_call { name_pattern = "[%w_]" },
      -- id: digits, ae/ie: word segment of camelCase/snake_case
      d = { "%f[%d]%d+" },
      e = {
        { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
        "^().*()$",
      },
      -- ag/ig: whole buffer
      g = function()
        local from = { line = 1, col = 1 }
        local to = { line = vim.fn.line "$", col = math.max(vim.fn.getline("$"):len(), 1) }
        return { from = from, to = to }
      end,
    })

    require("mini.ai").setup(opts)
  end,
}
