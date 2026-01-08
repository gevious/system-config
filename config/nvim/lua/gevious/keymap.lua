-- Shorten the function name
local map = vim.keymap.set

-- Make <Space> the leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--* Normal Mode *--
-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "[b", ":bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", ":bnext<cr>", { desc = "Next Buffer" })

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Open file explorer
map("n", "<leader>e", vim.cmd.Ex)

-- Show all map settings
map("n", "<leader>m", ":map<CR>", {desc = "Show keymap"})

-- Quit the window (or VIM if its the last window)
map("n", "<leader>q", ":q<CR>")

-- Clear search
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- commenting
map("n", "gcO", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gco", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- quickfix list
map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Make file executable (or not)
--vim.map.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--vim.map.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

-- Execute block
-- vim.map.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

--* Insert Mode *--
-- Press jk fast to exit insert mode 
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)

--* Visual *--
-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "p", '"_dP', opts)

--* Visual Block *--
-- Move text up and down
map("x", "J", ":m '>+1<CR>gv=gv", opts)
map("x", "K", ":m '<-2<CR>gv=gv", opts)
map("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

--* LSP *--
-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

local opts = { buffer = bufnr, noremap = true, silent = true }
map("n", "gt", vim.lsp.buf.type_definition, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gR", vim.lsp.buf.rename, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gf", vim.lsp.buf.format, opts)


-- open dialog only when asked
--vim.keymap.set('n', '<leader>e', function()
--    vim.diagnostic.open_float(nil, { focus = true })
--end, { desc = "Show diagnostics in floating window" })

-- toggle inlay hints
--if vim.lsp.inlay_hint then
--  Snacks.toggle.inlay_hints():map("<leader>uh")
--end
