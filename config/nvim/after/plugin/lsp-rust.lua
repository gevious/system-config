vim.lsp.configs = vim.lsp.configs or {}

vim.lsp.configs.rust_analyzer = {
    default_config = {
        cmd = { "rust-analyzer" }, -- ensures these are installed locally
        settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = true },
                procMacro = { enable = true },
                completion = {
                    autoimport = {
                        enable = true
                    }
                },
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
            }
        }
    }
}


--local bufnr = vim.api.nvim_get_current_buf()
--vim.keymap.set("n", "<leader>a",
--  function()
--    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
--    -- or vim.lsp.buf.codeAction() if you don't want grouping.
--  end,
--  { silent = true, buffer = bufnr }
--)
--
--vim.keymap.set("n", "K",
--  function()
--    vim.cmd.RustLsp({'hover', 'actions'})
--  end,
--  { silent = true, buffer = bufnr }
--)

--rt.setup({
--    tools = {
--        inlay_hints = {
--            only_current_line = true
--        },
--    },
--    server = {
--        on_attach = function(_, bufnr)
--            local telescope_builtin = require('telescope.builtin')
--            local opts = { noremap=true, silent=true, buffer=bufnr}
--            -- Hover actions
--            vim.keymap.set("n", "<C-[>a", rt.hover_actions.hover_actions, opts)
--            vim.keymap.set("n", "<C-[>c", rt.code_action_group.code_action_group, opts)
--            vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)
--
--            vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
--            vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, opts)
--            vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, opts)
--            vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, opts)
--            vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, opts)
--        end,
--    },
--})
