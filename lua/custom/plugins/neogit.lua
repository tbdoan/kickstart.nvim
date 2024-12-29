return {
  'tbdoan/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local ng = require 'neogit'
    local function toggle_neogit_status()
      local closed = require('custom.utils.closeneogit').close_neogit_windows()
      if closed then
        return
      end
      -- If it's not open, open Neogit's status window
      vim.cmd 'Neogit'
    end

    vim.keymap.set('n', '<C-g>', '<Nop>')
    vim.keymap.set('n', '<C-g>', toggle_neogit_status)
    ng.setup {
      kind = 'split_below_all',
      mappings = {
        status = {
          ['[c'] = 'GoToPreviousHunkHeader',
          [']c'] = 'GoToNextHunkHeader',
          ['}'] = 'NextSection',
          ['{'] = 'PreviousSection',
        },
      },
    }
  end,
}
