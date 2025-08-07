local lsp = require('lsp-zero')

lsp.preset("recommended")

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
    settings = {
        ['rust_analyzer'] = {}
    },
}

lspconfig.ts_ls.setup {
    settings = {
        ['typescript-language-server'] = {}
    },
}

-- key bindings for LSP completion
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    })
})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = "Show implementations" })
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<C-[>?", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<C-[>s", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<C-[><C-[>", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ forward = true, count = 1 }) end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ forward = false, count = 1 }) end, opts)
    vim.keymap.set("n", "]e",
        function() vim.diagnostic.jump({ forward = true, count = 1, severity = vim.diagnostic.severity.ERROR }) end,
        { desc = "Next error" })
    vim.keymap.set("n", "[e",
        function() vim.diagnostic.jump({ forward = false, count = 1, severity = vim.diagnostic.severity.ERROR }) end,
        { desc = "Previous error" })
    vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<C-[>f", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<C-[>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-[>h", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<C-]><C-]>", function()
        vim.diagnostic.setqflist()
        vim.cmd("copen")
    end, { desc = "List diagnostics" })
end)

-- Remove the global 'vim' warning in Nvim lua configs
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
