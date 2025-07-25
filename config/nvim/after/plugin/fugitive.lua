vim.keymap.set("n", "<leader>gs", ":vert G<CR>")
vim.keymap.set("n", "<leader>gb", ":vert G blame<CR>")
vim.keymap.set("n", "<leader>gl", ":vert G log<CR>")

-- pull latest changes so its easy to CR a change
vim.keymap.set("n", "<leader>gfo", ":G fetch origin '+refs/changes/*:refs/remotes/origin/changes/*'<CR>")
