local map = vim.keymap.set

-- Comment
map("n", "<C-/>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "toggle comment", remap = true })

-- Save on CTRL + s
map("n", "<C-s>", ":w<CR>", { desc = "save file" })

-- Open file in new tab
map("n", "<C-t>", ":tabnew<CR>", { desc = "open file in new tab" })

-- Navigate between tabs
map("n", "<C-Tab>", ":tabnext<CR>", { desc = "next tab" })
map("n", "<C-S-Tab>", ":tabprevious<CR>", { desc = "previous tab" })
