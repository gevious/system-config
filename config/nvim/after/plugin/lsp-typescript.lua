local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- Disable tsserver formatting in favor of prettier/eslint
        client.server_capabilities.documentFormattingProvider = false
    end,
}

-- ESLint
lspconfig.eslint.setup {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    capabilities = capabilities,
}

-- JSON (for tsconfig.json, package.json, etc.)
lspconfig.jsonls.setup {
    capabilities = capabilities,
}
