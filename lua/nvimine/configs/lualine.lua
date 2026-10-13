return {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { 'agentic' },
      -- The explorer's sidebar container: no winbar row at all.
      winbar = { 'snacks_layout_box' },
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "SessionLoadPost",
        "FileChangedShellPost",
        "VimResized",
        "Filetype",
        "CursorMoved",
        "CursorMovedI",
        "ModeChanged",
      },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", {
      "diagnostics",
    } },
    lualine_c = { "filename" },
    lualine_x = {
      "encoding",
      "fileformat",
      "filetype"
    },
    lualine_y = { "lsp_status" },
    lualine_z = {
      {
        "diff",
        colored = false,
        symbols = { added = "+", modified = "~", removed = "-" },
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "branch" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    -- The snacks explorer's sidebar is an unnamed container window (its list
    -- and input are floats inside it), so "filename" shows [No Name]. A split
    -- always has a statusline with laststatus=2; label it instead.
    {
      filetypes = { "snacks_layout_box" },
      sections = { lualine_a = { function() return "Explorer" end } },
      inactive_sections = { lualine_c = { function() return "Explorer" end } },
    },
  },
}
