require("git-worktree")

vim.keymap.set("n", "<leader>gwl", ":Telescope git_worktree git_worktrees<CR>")
vim.keymap.set("n", "<leader>gwc", ":Telescope git_worktree create_git_worktree<CR>")