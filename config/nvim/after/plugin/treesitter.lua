require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
      "html",
--      "help",
      "javascript",
      "typescript",
--      "java",
      "lua",
      "rust",
      "toml",
      "vim",
      "vimdoc"
  },

  auto_install = true,

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
--    disable = { "html" }, -- to ensure treesitter doesn't crash for html
    additional_vim_regex_highlighting = false,
  },
--  ident = { enable = true }, 
--  rainbow = {
--    enable = true,
--    extended_mode = true,
--    max_file_lines = nil,
--  }
}
