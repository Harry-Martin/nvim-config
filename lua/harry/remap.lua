vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.cmd.ClangdSwitchSourceHeader)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("i", "fd", "<Esc>")

vim.keymap.set("n", "<leader>tn", "<cmd>:tabnew<cr>")
vim.keymap.set("n", "<leader>th", "<cmd>:tabNext<cr>")
vim.keymap.set("n", "<leader>tl", "<cmd>:tabnext<cr>")
vim.keymap.set("n", "<leader>tq", "<cmd>:tabclose<cr>")

vim.keymap.set("n", "<leader>sv", "<cmd>:vsplit<cr>")
vim.keymap.set("n", "<leader>sh", "<cmd>:split<cr>")

vim.keymap.set("n", "<f5>", "<cmd>:! ./compile ~<cr>")


vim.cmd('colorscheme base4tone_modern_n_dark')
