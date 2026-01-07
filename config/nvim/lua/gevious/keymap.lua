-- Shorten the function name
local keymap = vim.keymap.set

-- Make <Space> the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--* Normal Mode *--
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Open file explorer
keymap("n", "<leader>e", vim.cmd.Ex)

-- Show all keymap settings
keymap("n", "<leader>m", ":map<CR>", {desc = "Show keymap"})

-- Quit the window (or VIM if its the last window)
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Make file executable (or not)
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Execute block
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

--* Insert Mode *--
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

--* Visual *--
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

--* Visual Block *--
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)
