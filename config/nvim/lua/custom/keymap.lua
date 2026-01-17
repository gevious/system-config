-- Shorten the function name
local map = vim.keymap.set

-- Navigate buffers
map('n', '<S-l>', ':bnext<CR>', { desc = 'Move to next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'move to previous buffer' })

-- Move text up and down
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line up' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line down' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move line down' })

-- Open file explorer
map('n', '<leader>e', vim.cmd.Ex, { desc = 'Open file explorer' })

-- Quit the window (or VIM if its the last window)
map('n', '<leader>q', ':q<CR>', { desc = 'Quit window' })

-- Press jk fast to exit insert mode
map('i', 'jk', '<ESC>', { desc = 'exit insert mode' })
map('i', 'kj', '<ESC>', { desc = 'exit insert mode' })
