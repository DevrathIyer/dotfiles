-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- clear highlights
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- Split binds
vim.keymap.set("n", "ƒ", ":vsp<CR>", { desc = "Open new vertical split", silent = true })
vim.keymap.set("n", "∂", ":sp<CR>", { desc = "Open new horizontal split", silent = true })

-- nmap  <A-h>
vim.keymap.set("n", "˙", "<C-W><C-H>", { desc = "Move to left split" })
vim.keymap.set("n", "∆", "<C-W><C-J>", { desc = "Move down a split" })
vim.keymap.set("n", "˚", "<C-W><C-K>", { desc = "Move up a split" })
vim.keymap.set("n", "¬", "<C-W><C-L>", { desc = "Move to right split" })
vim.keymap.set("n", "∑", ":tab close", { desc = "Move down a split" })

vim.keymap.set("n", "<Leader>;", "<C-W>R", { desc = "Swap splits" })
vim.keymap.set("n", "<C-U>", "<C-U>zz", { desc = "Move Up (centered)", silent = true })
vim.keymap.set("n", "<C-D>", "<C-D>zz", { desc = "Move Down (centered)", silent = true })

-- terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
