local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {desc="Find files"})
vim.keymap.set('n', '<leader>g', builtin.git_files, {desc="Find git files"})
vim.keymap.set('n', '<leader>s', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


-- Easily close telescope window
require("telescope").setup({
  defaults = {
    mappings = {
      -- insert mode
      i = { ["<leader>jk"] = actions.close },
      -- normal mode
      n = { ["<leader>jk"] = actions.close },
    },
  },
})
