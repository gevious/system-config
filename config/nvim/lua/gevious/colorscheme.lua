local colorscheme = "catppuccin"

-- for safety, so nvim doesn't crash if the colorscheme doesn't exit
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
