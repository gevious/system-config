-- Contains all startup options for neovim

local options = {
--  undodir = os.getenv("HOME") .. "/.vim/undodir"

  backup = false,            -- do not keep backups
  swapfile = false,          -- do not create swapfile
  undofile = true,           -- persistent undo file

  clipboard = "unnamedplus", -- allows neovim to access the system clipboard

  nu = true,                 -- show line numbers
  relativenumber = true,     -- show relative line numbers
  numberwidth = 2,           -- number column width { default 4 }
  showmode = false,          -- Don't show the mode line (like 'Insert')

  tabstop = 4,               -- use 4 spaces for tab
  -- softtabstop = 4,
  shiftwidth = 4,            -- number of spaces per indentation
  expandtab = true,          -- convert tabs to spaces
  smartindent = true,        -- Smart indenting for a new line

  hlsearch = true,           -- highlight text for last search
  wrap = false,              -- do not wrap text
  spell = false,             -- do not spell check
  scrolloff = 3,             -- min lines to show for vertical scrolling
  sidescrolloff = 3,         -- min lines to show for horizontal scrolling

  updatetime = 50,           -- completion time (4000ms default)
  timeoutlen = 300,          -- time to wait for mapped sequence to complete

  foldenable = true,         -- keep everything open by default
  foldmethod = "indent",     -- use indent to determine fold lines
  mouse = "a",               -- allow using mouse always
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- TODO: understand these more before enabling
-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
-- vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
-- vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
-- vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.


