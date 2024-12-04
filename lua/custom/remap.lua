return {
  vim.keymap.set('i', 'jj', '<Esc>'),
  vim.keymap.set('n', '<C-d>', '<C-d>zz'),
  vim.keymap.set('n', '<C-u>', '<C-u>zz'),
  vim.keymap.set('n', 'n', 'nzz'),
  vim.keymap.set('n', 'N', 'Nzz'),
  vim.keymap.set('x', '<leader>p', [["_dP]]), -- paste without yank,
  vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]]), -- yank into system register
}
