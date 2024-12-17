return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    local ng = require 'neogit'
    vim.keymap.set('n', '<C-g>', '<Nop>')
    vim.keymap.set('n', '<C-g>', ng.open)
    ng.setup {
      kind = 'split_below_all',
    }
  end,
}
