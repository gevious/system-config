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
local cmp = require ('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    })
})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({buffer = bufnr})
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "<C-l>gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<C-l>?", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<C-l>ss", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<C-l>d", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<C-l>n", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<C-l>p", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<C-l>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<C-l>rr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<C-l>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Remove the global 'vim' warning in Nvim lua configs
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()


