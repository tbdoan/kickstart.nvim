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
      -- Get a list of all open windows
      local windows = vim.api.nvim_list_wins()
      local closed = false
      -- Check if Neogit's status window is already open
      for _, win in ipairs(windows) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
        if bufname:match 'Neogit%w+$' then
          -- Close the Neogit status window if it is open
          vim.api.nvim_win_close(win, true)
          closed = true
        end
      end
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
