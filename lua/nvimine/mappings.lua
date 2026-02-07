local map = vim.keymap.set

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })
map("n", "<leader>F", ":NvimTreeFindFileToggle<CR>", { desc = "Find current file in file explorer" })
map("n", "<leader>f", ":NvimTreeFindFile<CR>", { desc = "Find current file in file explorer without toggling" })

-- whichkey
map("n", "<leader>wK", ":WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
    vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })
