return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  config = function()
    require('nvim-tree').setup {
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 'M', api.tree.collapse_all, opts 'Collapse All')
        vim.keymap.del('n', '<C-e>', { buffer = bufnr })
        local treeutils = require 'custom.utils.treeutils'

        vim.keymap.set('n', '<leader>fif', treeutils.launch_find_files, opts 'Launch Find Files')
        vim.keymap.set('n', '<leader>fig', treeutils.launch_live_grep, opts 'Launch Live Grep')
      end,
    }
    vim.keymap.set('n', '<leader>p', require('nvim-tree.api').tree.toggle, { desc = 'Toggle File Tree' })
    vim.keymap.set('n', '<leader>S', function()
      require('nvim-tree.api').tree.find_file { open = true, focus = true }
    end, { desc = '[S]how file' })
  end,
}
