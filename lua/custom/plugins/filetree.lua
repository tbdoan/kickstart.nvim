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
      renderer = {
        group_empty = true,
      },
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- BEGIN_DEFAULT_ON_ATTACH
        vim.keymap.set('n', 'K', api.node.show_info_popup, opts 'Info')
        vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts 'Open: Vertical Split')
        vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts 'Open: Horizontal Split')
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '<Tab>', api.node.open.preview, opts 'Open Preview')
        vim.keymap.set('n', 'a', api.fs.create, opts 'Create File Or Directory')
        vim.keymap.set('n', 'bd', api.marks.bulk.delete, opts 'Bookmark: Delete')
        vim.keymap.set('n', 'bt', api.marks.bulk.trash, opts 'Bookmark: Trash')
        vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts 'Bookmark: Move')
        vim.keymap.set('n', 'c', api.fs.copy.node, opts 'Copy')
        vim.keymap.set('n', 'D', api.fs.remove, opts 'Delete')
        vim.keymap.set('n', 'd', api.fs.trash, opts 'Trash')
        vim.keymap.set('n', 'E', api.tree.expand_all, opts 'Expand All')
        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
        vim.keymap.set('n', 'm', api.marks.toggle, opts 'Bookmark: Toggle')
        vim.keymap.set('n', 'p', api.fs.paste, opts 'Paste')
        vim.keymap.set('n', 'P', api.node.navigate.parent, opts 'Parent Directory')
        vim.keymap.set('n', 'r', api.fs.rename, opts 'Rename')
        vim.keymap.set('n', 'R', api.tree.change_root_to_node, opts 'Reroot')
        vim.keymap.set('n', '<c-r>', api.tree.reload, opts 'Refresh')
        vim.keymap.set('n', 'M', api.tree.collapse_all, opts 'Collapse All')
        vim.keymap.set('n', 'x', api.fs.cut, opts 'Cut')
        vim.keymap.set('n', 'yw', api.fs.copy.filename, opts 'Copy Name')
        vim.keymap.set('n', 'yy', api.fs.copy.relative_path, opts 'Copy Relative Path')
        vim.keymap.set('n', 'yY', api.fs.copy.absolute_path, opts 'Copy Absolute Path')
        vim.keymap.set('n', 'f.', api.tree.toggle_hidden_filter, opts 'Toggle Filter: Dotfiles')
        vim.keymap.set('n', 'fi', api.tree.toggle_gitignore_filter, opts 'Toggle Filter: Git Ignore')
        -- END_DEFAULT_ON_ATTACH

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
