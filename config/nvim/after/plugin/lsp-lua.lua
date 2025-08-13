require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Tell the LSP that 'vim' exists
      },
    },
  },
}

