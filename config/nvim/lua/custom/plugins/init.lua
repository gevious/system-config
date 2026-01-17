-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Git
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gdiffsplit', 'Gread', 'Gwrite' },
    keys = {
      { '<leader>gs', '<cmd>Git<CR>', desc = 'Git status' },
      { '<leader>gb', '<cmd>Git blame<CR>', desc = 'Git blame' },
      { '<leader>gl', '<cmd>Git log<CR>', desc = 'Git log' },
      { '<leader>gfo', '<cmd>Git fetch origin<CR>', desc = 'Git fetch origin' },
    },
  },

  -- Table mode
  { 'dhruvasagar/vim-table-mode' },
}
