local function is_project_win(win)
  win = win or 0
  local bufnr = vim.api.nvim_win_get_buf(win)
  -- if buffer is modifiable, we assume it's a project file
  return vim.api.nvim_get_option_value('modifiable', { buf = bufnr })
end

local function find_main_win()
  if is_project_win() then
    print 'is project win'
    return vim.api.nvim_get_current_win()
  end

  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    if is_project_win(win) then
      print('found nother project win ' .. win)
      return win
    end
  end

  return vim.api.nvim_open_win(0, true, { split = 'above' })
end

local M = {}
-- 1. close non project windows
-- 2. if i'm in a project buf, use that
-- 3. if there is a project buf, use that
-- 4. open a new win, use that
M.only_window = function(_, _)
  -- if we're in a project buffer, use that
  local ret = find_main_win()

  local wins = vim.api.nvim_list_wins()
  print(ret)
  for _, win in ipairs(wins) do
    if win ~= ret and not is_project_win(win) then
      vim.api.nvim_win_close(win, false)
    end
  end

  return ret
end

return M
