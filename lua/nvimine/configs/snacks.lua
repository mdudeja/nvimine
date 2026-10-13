return {
  bigfile = { enabled = true },
  dashboard = { enabled = true, example = "advanced" },
  explorer = { enabled = true },
  indent = {
    enabled = true,
    chunk = {
      enabled = true,
    },
  },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
    -- Only decides the popup: every notification is still kept in the
    -- history (<leader>n). Routine agentic.nvim server chatter stays quiet;
    -- its warnings and errors still pop up.
    filter = function(notif)
      local quiet = notif.msg:find("^%[agentic%]") and vim.log.levels[notif.level:upper()] < vim.log.levels.WARN
      return not quiet
    end,
  },
  picker = {
    enabled = true,
    sources = {
      -- Explorer filters live on its picker source, not the top-level `explorer`.
      explorer = {
        hidden = true,  -- dotfiles
        ignored = true, -- gitignored (e.g. .agentic/)
        actions = {
          -- Open the file manager with the item highlighted (falls back to opening its folder).
          reveal_in_file_manager = function(_, item)
            if not item then return end
            local uri = vim.uri_from_fname(item.file)
            vim.system({
              "dbus-send", "--session", "--dest=org.freedesktop.FileManager1", "--type=method_call",
              "/org/freedesktop/FileManager1", "org.freedesktop.FileManager1.ShowItems",
              "array:string:" .. uri, "string:",
            }, {}, function(res)
              if res.code ~= 0 then
                vim.schedule(function() vim.ui.open(vim.fn.fnamemodify(item.file, ":h")) end)
              end
            end)
          end,
          copy_relative_path = function(_, item)
            if not item then return end
            local p = vim.fn.fnamemodify(item.file, ":.")
            vim.fn.setreg("+", p)
            Snacks.notify.info("Copied " .. p)
          end,
          copy_file_name = function(_, item)
            if not item then return end
            local p = vim.fn.fnamemodify(item.file, ":t")
            vim.fn.setreg("+", p)
            Snacks.notify.info("Copied " .. p)
          end,
        },
        win = {
          list = {
            keys = {
              ["O"] = "reveal_in_file_manager",
              ["Y"] = "copy_relative_path",
              ["gy"] = "copy_file_name",
            },
          },
        },
      },
    },
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  image = { enabled = true },
  terminal = { enabled = true },
  lazygit = { enabled = true },
  gitbrowse = { enabled = true },
  scratch = { enabled = true },
  styles = {
    notification = {
      wo = { wrap = true }, -- Wrap notifications
    },
  },
}
