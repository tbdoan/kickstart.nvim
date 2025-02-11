return {
  -- plain annoying
  vim.keymap.set('n', 'J', 'j'),

  -- bum ass behavior
  vim.keymap.set('i', 'jj', '<Esc>'),
  vim.keymap.set('i', 'jJ', '<Esc>'),
  vim.keymap.set('i', 'JJ', '<Esc>'),
  vim.keymap.set('i', 'Jj', '<Esc>'),

  vim.keymap.set('n', '<C-d>', '<C-d>zz'),
  vim.keymap.set('n', '<C-u>', '<C-u>zz'),
  vim.keymap.set('n', 'n', 'nzz'),
  vim.keymap.set('n', 'N', 'Nzz'),
  vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'paste without yank' }),
  vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'yank into system register' }),
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  vim.keymap.set({ 'i', 'n' }, '<c-y>', function()
    -- testing testing testing
    local trimmed_yank = vim.trim(vim.fn.getreg '"')
    vim.api.nvim_put({ trimmed_yank }, '', true, true)
  end, { desc = 'trim whitespace and paste' }),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),
  vim.keymap.set('n', '<Tab>', 'za'),
  vim.keymap.set('n', '<c-f>', '<c-i>', { desc = '[F]orward' }),
  vim.keymap.set('n', '<leader>tc', function()
    vim.api.nvim_command 'tabc'
  end, { desc = '[T]ab [C]lose' }),
  vim.keymap.set('n', '<leader>tn', function()
    vim.api.nvim_command 'tabn'
  end, { desc = '[T]ab [N]ext' }),
  vim.keymap.set('n', '<c-w>s', '<c-w>x', { desc = '[S]witch windows' }),
  vim.keymap.set('n', '<c-w>x', '<c-w>s', { desc = 'Split window horizontally' }),
}
