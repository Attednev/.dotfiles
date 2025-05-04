
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection DOWN" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection UP" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace & Preserve Yank" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete & Preserve Yank" })

vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Yank selection to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>=", "ma=ap'a", { desc = "Reformat Paragraph & Peserve Cursor" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save Current File" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Rename (Native)" })

vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")

vim.keymap.set({"i", "v"}, "jk", "<Esc>", { desc = "Escape Remap" })
vim.keymap.set({"i", "v"}, "jj", "<Esc>", { desc = "Escape Remap" })

-- Center after jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "J", "mzJ`z")

