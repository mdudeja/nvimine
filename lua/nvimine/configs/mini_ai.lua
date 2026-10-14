return {
  -- Search this many lines around the cursor for a textobject
  n_lines = 500,
  -- an/in stay with Neovim's treesitter selection; "next"/"last" variants move to aN/iN, aL/iL
  mappings = {
    around_next = "aN",
    inside_next = "iN",
    around_last = "aL",
    inside_last = "iL",
  },
  -- Extra textobjects (function/class/block/...) are added in plugins/mini_ai.lua
  custom_textobjects = {},
}
