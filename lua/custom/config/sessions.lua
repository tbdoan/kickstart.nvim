require('mini.sessions').setup {
  file = '',
  hooks = {
    pre = {
      write = function()
        require('custom.utils.closeneogit').close_neogit_windows()
        require('nvim-tree.api').tree.close()
      end,
    },
  },
}

local function get_session_name()
  local session_name = vim.fn.getcwd():gsub('/', '-')
  return session_name
end

vim.api.nvim_create_autocmd('VimLeave', {
  pattern = '*',
  callback = function()
    MiniSessions.write(get_session_name())
  end,
})

MiniSessions.read(get_session_name())
