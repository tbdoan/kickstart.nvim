local M = {}

--- Closes any open Neogit status windows.
--
-- @return boolean: `true` if a Neogit window was closed, `false` otherwise.
M.close_neogit_windows = function()
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

  return closed
end

return M
