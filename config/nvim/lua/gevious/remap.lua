vim.g.mapleader = " "

-- Open directory editor
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move higlighted text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor management for common functions
vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z") -- keep cursor static for 'J'
-- keep cursor in the middle for these commands
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve highlighted text in yank buffer when pasting over other highlighted text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- System clipboard yanking
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

-- Deleting to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Q goes to nothing, to prevent repeating last recorded commands
vim.keymap.set("n", "Q", "<nop>")

-- Quit the window (or VIM if its the last window)
vim.keymap.set("n", "<leader>q", ":q<CR>")
-- Switch projects with tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable (or not)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
