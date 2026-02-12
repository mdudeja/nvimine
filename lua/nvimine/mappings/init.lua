local map = vim.keymap.set

-- Comment
map("n", "<C-/>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "toggle comment", remap = true })
map("i", "<C-/>", "<ESC>gcc", { desc = "toggle comment", remap = true })
