local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local action_state = require 'telescope.actions.state'
local actions = require 'telescope.actions'

-- Toggle hidden files when searching for files
local show_hidden = false

local function restart_find_files(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt_text = picker:_get_prompt()
  local prompt_title = picker.prompt_title

  actions.close(prompt_bufnr)

  builtin.find_files {
    hidden = show_hidden,
    default_text = prompt_text, -- 👈 restores search
    prompt_title = prompt_title,
  }
end

local function toggle_hidden(prompt_bufnr)
  show_hidden = not show_hidden
  restart_find_files(prompt_bufnr)
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-h>'] = toggle_hidden,
      },
      n = {
        ['<C-h>'] = toggle_hidden,
      },
    },
    which_key = {
      ['<C-h>'] = 'Toggle hidden files',
    },
  },
}
