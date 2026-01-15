local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- Install Lazy package manager if not installed
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- useful utilities for lots of plugins
    'nvim-lua/plenary.nvim',

    -- Useful snippets
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      ---@type snacks.Config
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below

        --bigfile = { enabled = true },
        --dashboard = { enabled = true },
        --explorer = { enabled = true },
        --indent = { enabled = true },
        --input = { enabled = true },
        --picker = { enabled = true },
        --notifier = { enabled = true },
        --quickfile = { enabled = true },
        --scope = { enabled = true },
        --scroll = { enabled = true },
        --statuscolumn = { enabled = true },
        --words = { enabled = true },
      },
    },

    -- Code formatting: Highlight, editing, navigating
    'nvim-treesitter/nvim-treesitter',

    -- Color scheme
    'catppuccin/nvim',

    -- fuzzy finder
    'junegunn/fzf',

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },

    -- Table mode
    'dhruvasagar/vim-table-mode',

    -- Undo tree for navigating undo history
    'mbbill/undotree',

    -- Git tools
    'tpope/vim-fugitive',

    -- asciidoctor
    'habamax/vim-asciidoctor',

    -- Autocomplete
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',
	'saadparwaiz1/cmp_luasnip',  -- snippet completions

    -- Harpoon for keeping files in the shortlist
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    },

    -- LSP Things
    {
        'neovim/nvim-lspconfig',
        lazy = true,
    },
    -- Rust LSP
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
    },
    -- Java LSP
    {
      'mfussenegger/nvim-jdtls',
      ft = { "java" },
    },
    -- LSP Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
})
