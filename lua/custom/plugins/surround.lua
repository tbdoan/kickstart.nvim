return {
  'echasnovski/mini.surround',
  version = false,
  config = function()
    vim.keymap.set({ 'n', 'v' }, 's', '<Nop>')
    vim.keymap.set({ 'n', 'v' }, 'S', '<Nop>')
    require('mini.surround').setup()
  end,
}
