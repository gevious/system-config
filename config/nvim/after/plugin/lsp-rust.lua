require("lspconfig").rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
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
})



local rt = require("rust-tools")

rt.setup({
    tools = {
        inlay_hints = {
            only_current_line = true
        },
    },
    server = {
        on_attach = function(_, bufnr)
            local opts = { buffer = bufnr }
            -- Hover actions
            vim.keymap.set("n", "<C-tab>", rt.hover_actions.hover_actions, opts)
            -- Code action groups
            vim.keymap.set("n", "<C-[>a", rt.code_action_group.code_action_group, opts)
            vim.keymap.set("n", "<C-[>f", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<C-[>r", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<C-[>h", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = "Show implementations" })
        end,
    },
})

--lsp.on_attach(function(_, bufnr)
--    lsp.default_keymaps({ buffer = bufnr })
--    local opts = { buffer = bufnr, remap = false }
--
--    vim.keymap.set("n", "<C-[>?", function() vim.lsp.buf.hover() end, opts)
--    vim.keymap.set("n", "<C-[>s", function() vim.lsp.buf.workspace_symbol() end, opts)
--    vim.keymap.set("n", "<C-[><C-[>", function() vim.diagnostic.open_float() end, opts)
--    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ forward = true, count = 1 }) end, opts)
--    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ forward = false, count = 1 }) end, opts)
--    vim.keymap.set("n", "]e",
--        function() vim.diagnostic.jump({ forward = true, count = 1, severity = vim.diagnostic.severity.ERROR }) end,
--        { desc = "Next error" })
--    vim.keymap.set("n", "[e",
--        function() vim.diagnostic.jump({ forward = false, count = 1, severity = vim.diagnostic.severity.ERROR }) end,
--        { desc = "Previous error" })
--    vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
--    vim.keymap.set("n", "<C-]><C-]>", function()
--        vim.diagnostic.setqflist()
--        vim.cmd("copen")
--    end, { desc = "List diagnostics" })
--end)
