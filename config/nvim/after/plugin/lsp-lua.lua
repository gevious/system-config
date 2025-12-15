vim.lsp.configs = vim.lsp.configs or {}
vim.lsp.config.lua_ls = {
  default_config = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }, -- Tell the LSP that 'vim' exists
        },
      },
    },
  }
}
