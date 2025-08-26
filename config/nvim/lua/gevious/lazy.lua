local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- Install Lazy package manager if not installed
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    --
    -- LSP SETUP
    -- Assumes existance of LSP clients like rust-analyzer

    -- LSP tools
    'neovim/nvim-lspconfig',
    'simrat39/rust-tools.nvim',
    {
      'mfussenegger/nvim-jdtls',
      ft = { "java" },
    },

    -- LSP Autocompletion
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',

    -- Code formatting: Highlight, editing, navigating
    'nvim-treesitter/nvim-treesitter',


    -- LSP Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- Git source control tools
    'tpope/vim-fugitive',

    -- Undo tree for navigating undo history
    'mbbill/undotree',

    -- Table mode
    'dhruvasagar/vim-table-mode',

    -- Telescope (Fuzzy finder)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    -- Color scheme
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000
    },

    -- Harpoon for fast switching between files
    'nvim-lua/plenary.nvim',
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    },

    -- fuzzy finder
    { 'junegunn/fzf' },


    -- Java LSP
    --    {
    --      'nvim-java/nvim-java',
    --      dependencies = {
    --        'nvim-java/lua-async-await',
    --        'nvim-java/nvim-java-refactor',
    --        'nvim-java/nvim-java-core',
    --        'nvim-java/nvim-java-test',
    --        'nvim-java/nvim-java-dap',
    --        'MunifTanjim/nui.nvim',
    --        'neovim/nvim-lspconfig',
    --        'mfussenegger/nvim-dap',
    --      },
    --    },

    -- git worktrees plugin
    { 'ThePrimeagen/git-worktree.nvim' },

    --    -- plantuml previewer
    --    {'weirongxu/plantuml-previewer.vim',
    --        dependencies = {
    --            'tyru/open-browser.vim',
    --            'aklt/plantuml-syntax'
    --        },
    --    },

    -- asciidoctor
    {
        'habamax/vim-asciidoctor'
    },
})

-- Need this for the Java lsp
-- require('java').setup()
-- require('lspconfig').jdtls.setup({})
