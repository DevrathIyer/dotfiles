-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- clear highlights
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- Split binds
vim.keymap.set("n", "<M-f>", ":vsp<CR>", { desc = "Open new vertical split", silent = true })
vim.keymap.set("n", "<M-d>", ":sp<CR>", { desc = "Open new horizontal split", silent = true })

vim.keymap.set("n", "<M-h>", "<C-W><C-H>", { desc = "Move to left split" })
vim.keymap.set("n", "<M-l>", "<C-W><C-L>", { desc = "Move to right split" })
vim.keymap.set("n", "<M-k>", "<C-W><C-K>", { desc = "Move up a split" })
vim.keymap.set("n", "<M-j>", "<C-W><C-J>", { desc = "Move down a split" })
vim.keymap.set("n", "<M-w>", ":tab close", { desc = "Move down a split" })

vim.keymap.set("n", "<Leader>;", "<C-W>R", { desc = "Swap splits" })
vim.keymap.set("n", "<C-U>", "<C-U>zz", { desc = "Move Up (centered)", silent = true })
vim.keymap.set("n", "<C-D>", "<C-D>zz", { desc = "Move Down (centered)", silent = true })
