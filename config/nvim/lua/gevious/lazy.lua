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

    -- Pencil for writing
    {
        'preservim/vim-pencil',
        event = "BufReadPre", -- optional, load only when opening a buffer
        config = function()
            -- Optional settings
            vim.g["pencil#wrapMode"] = "soft" -- soft wrap
            vim.g["pencil#textwidth"] = 80
        end
    },

    --
    -- LSP SETUP
    -- Assumes existance of LSP clients like rust-analyzer

    -- LSP tools
    {
    'neovim/nvim-lspconfig',
    lazy = true,
    -- ft = { "typescript", "rust", "java"},
    ft = { "typescript", "rust"},
    config = function()
        vim.lsp.start({ name = "rust-analyzer" })
        vim.lsp.start({ name = "tsserver" })
        vim.lsp.start({ name = "jdtls" })
        vim.lsp.start({ name = "zls" })
    end,
    },
    -- Rust LSP
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    -- Java LSP
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
