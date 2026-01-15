local util = require("lspconfig.util")

-- ---- Helper ----
local function start_lsp(config)
  local bufnr = vim.api.nvim_get_current_buf()
  for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
    if client.name == config.name then return end
  end

  local fname = vim.api.nvim_buf_get_name(bufnr)
  if fname == "" then return end

  local root = config.root_dir(fname)
  if not root then return end

  vim.lsp.start({
    name = config.name,
    cmd = config.cmd,
    root_dir = root,
    filetypes = config.filetypes,
  })
end

-- ---- tsserver ----
vim.lsp.config.tsserver = {
  name = "tsserver",
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
  end,
}

-- ---- eslint ----
vim.lsp.config.eslint = {
  name = "eslint",
  cmd = { "eslint", "--stdin" }, -- Correct LSP executable
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function(fname)
    return util.root_pattern(".eslintrc", ".eslintrc.json", "package.json", ".git")(fname)
  end,
}

-- ---- auto-start ----
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    start_lsp(vim.lsp.config.tsserver)
    start_lsp(vim.lsp.config.eslint)
  end,
})

-- ---- start immediately for loaded buffers ----
for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(bufnr) then
    local ft = vim.bo[bufnr].filetype
    if ft == "javascript" or ft == "javascriptreact" or ft == "typescript" or ft == "typescriptreact" then
      vim.api.nvim_buf_call(bufnr, function()
        start_lsp(vim.lsp.config.tsserver)
        start_lsp(vim.lsp.config.eslint)
      end)
    end
  end
end
