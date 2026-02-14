local map = vim.keymap.set

-- Top Pickers & Explorer
map("n", "<C-p>", function()
  Snacks.picker.smart()
end, { desc = "Smart Search" })
map("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Search Buffers" })
map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Search Command History" })
map("n", "<leader>n", function()
  Snacks.picker.notifications()
end, { desc = "Search Notification History" })
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Toggle File Explorer" })

-- find
map("n", "<leader>fc", function()
  Snacks.picker.files { cwd = vim.fn.stdpath "config" }
end, { desc = "Find Config File" })
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
  Snacks.picker.git_files()
end, { desc = "Find Git Files" })
map("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Find Projects" })
map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Find Recent Files" })

-- git
map("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Search Git Branches" })
map("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Search Git Log" })
map("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, { desc = "Search Git Log Line" })
map("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Search Git Status" })
map("n", "<leader>gS", function()
  Snacks.picker.git_stash()
end, { desc = "Search Git Stash" })
map("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "Search Git Diff (Hunks)" })
map("n", "<leader>gf", function()
  Snacks.picker.git_log_file()
end, { desc = "Search Git Log File" })

-- gh
map("n", "<leader>gi", function()
  Snacks.picker.gh_issue()
end, { desc = "Search GitHub Issues (open)" })
map("n", "<leader>gI", function()
  Snacks.picker.gh_issue { state = "all" }
end, { desc = "Search GitHub Issues (all)" })
map("n", "<leader>gp", function()
  Snacks.picker.gh_pr()
end, { desc = "Search GitHub Pull Requests (open)" })
map("n", "<leader>gP", function()
  Snacks.picker.gh_pr { state = "all" }
end, { desc = "Search GitHub Pull Requests (all)" })

-- grep
map("n", "<leader>/b", function()
  Snacks.picker.lines()
end, { desc = "Search Buffer Lines" })
map("n", "<leader>/B", function()
  Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })
map({ "n", "x" }, "<leader>/w", function()
  Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

-- search
map("n", '<leader>s"', function()
  Snacks.picker.registers()
end, { desc = "Search Registers" })
map("n", "<leader>s/", function()
  Snacks.picker.search_history()
end, { desc = "Search History" })
map("n", "<leader>sa", function()
  Snacks.picker.autocmds()
end, { desc = "Search Autocmds" })
map("n", "<leader>sb", function()
  Snacks.picker.lines()
end, { desc = "Search Buffer Lines" })
map("n", "<leader>sc", function()
  Snacks.picker.command_history()
end, { desc = "Search Command History" })
map("n", "<leader>sC", function()
  Snacks.picker.commands()
end, { desc = "Search Commands" })
map("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "Search Diagnostics" })
map("n", "<leader>sD", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Search Buffer Diagnostics" })
map("n", "<leader>sh", function()
  Snacks.picker.help()
end, { desc = "Search Help Pages" })
map("n", "<leader>sH", function()
  Snacks.picker.highlights()
end, { desc = "Search Highlights" })
map("n", "<leader>si", function()
  Snacks.picker.icons()
end, { desc = "Search Icons" })
map("n", "<leader>sj", function()
  Snacks.picker.jumps()
end, { desc = "Search Jumps" })
map("n", "<leader>sk", function()
  Snacks.picker.keymaps()
end, { desc = "Search Keymaps" })
map("n", "<leader>sl", function()
  Snacks.picker.loclist()
end, { desc = "Search Location List" })
map("n", "<leader>sm", function()
  Snacks.picker.marks()
end, { desc = "Search Marks" })
map("n", "<leader>sM", function()
  Snacks.picker.man()
end, { desc = "Search Man Pages" })
map("n", "<leader>sp", function()
  Snacks.picker.lazy()
end, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", function()
  Snacks.picker.qflist()
end, { desc = "Search Quickfix List" })
map("n", "<leader>sR", function()
  Snacks.picker.resume()
end, { desc = "Search Resume" })
map("n", "<leader>su", function()
  Snacks.picker.undo()
end, { desc = "Search Undo History" })
map("n", "<leader>uC", function()
  Snacks.picker.colorschemes()
end, { desc = "Search Colorschemes" })

-- others
map("n", "<leader>z", function()
  Snacks.zen()
end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function()
  Snacks.zen.zoom()
end, { desc = "Toggle Zoom" })
map("n", "<leader>.", function()
  Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function()
  Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })
map("n", "<leader>n", function()
  Snacks.notifier.show_history()
end, { desc = "Notification History" })
map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map("n", "<leader>bda", function()
  local all_buffers = vim.api.nvim_list_bufs()

  dd(all_buffers)

  if #all_buffers == 0 then
    Snacks.notify("No buffers to delete", "info")
    return
  end

  for _, buf in ipairs(all_buffers) do
    Snacks.bufdelete(buf)
  end
end, { desc = "Delete All Buffers" })

map("n", "<leader>cR", function()
  Snacks.rename.rename_file()
end, { desc = "Rename File" })
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Launch Lazygit" })
map("n", "<leader>un", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })
map({ "n", "v" }, "<leader>gB", function()
  Snacks.gitbrowse()
end, { desc = "Git Browse" })
map({ "n", "t" }, "]]", function()
  Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

map("n", "<leader>N", function()
  Snacks.win {
    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    width = 0.6,
    height = 0.6,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
  }
end, { desc = "Neovim News" })

map({ "n", "t" }, "<leader>t", function()
  Snacks.terminal()
end, { desc = "Terminal: toggle" })
map({ "n", "t" }, "<C-`>", function()
  local terminals = Snacks.terminal.list()
  if #terminals == 0 then
    Snacks.terminal()
  else
    for _, term in ipairs(terminals) do
      term:toggle()
    end
  end
end, { desc = "Terminal: toggle all", remap = true })

-- show dashboard
map("n", "<leader>0", function()
  Snacks.dashboard.open()
end, { desc = "Dashboard" })
