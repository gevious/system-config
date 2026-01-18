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

  -- Harpoon
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = { { 'nvim-lua/plenary.nvim' } },
    keys = function()
      local harpoon_mark = require 'harpoon.mark'
      local harpoon_ui = require 'harpoon.ui'

      local nav_file = function(n)
        return function()
          harpoon_ui.nav_file(n)
        end
      end

      return {
        {
          '<leader>ha',
          function()
            harpoon_mark.add_file()
          end,
          desc = 'Harpoon Add File',
        },
        {
          '<leader>hh',
          function()
            harpoon_ui.toggle_quick_menu()
          end,
          desc = 'Harpoon Menu',
        },
        { '<leader>hf', nav_file(1), desc = 'Jump to 1st file' },
        { '<leader>hd', nav_file(2), desc = 'Jump to 2nd file' },
        { '<leader>hs', nav_file(3), desc = 'Jump to 3rd file' },
      }
    end,
  },
}
