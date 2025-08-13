--
-- General LSP settings
--

-- Use Neovim's built-in diagnostics for LSP warnings
---- LSP Diagnostics Options Setup
--local sign = function(opts)
--    vim.fn.sign_define(opts.name, {
--        texthl = opts.name,
--        text = opts.text,
--        numhl = ''
--    })
--end
--
--sign({ name = 'DiagnosticSignError', text = '' })
--sign({ name = 'DiagnosticSignWarn', text = '' })
--sign({ name = 'DiagnosticSignHint', text = '' })
--sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- Show all diagnostics in telescope
local telescope = require("telescope.builtin")

-- Show diagnostics for project
vim.keymap.set('n', '<leader>xx', function()
    telescope.diagnostics()
end, { desc = "List all diagnostics in Telescope" })

-- Show diagnostics for current bffer
vim.keymap.set('n', '<leader>xl', function()
    telescope.diagnostics({ bufnr = 0 })
end, { desc = "List buffer diagnostics in Telescope" })


-- open dialog only when asked
vim.keymap.set('n', '<leader>e', function()
    vim.diagnostic.open_float(nil, { focus = true })
end, { desc = "Show diagnostics in floating window" })

--vim.cmd([[
--set signcolumn=yes
--autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
--]])
