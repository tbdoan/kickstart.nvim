local M = {}

M.only_window = function(_, _)
  -- Iterate through all windows to find the one with the smallest row (closest to the top)
  local wins = vim.api.nvim_list_wins()
  local keep = vim.api.nvim_open_win(0, true, { split = 'above' })
  for _, win in ipairs(wins) do
    if win ~= keep then
      vim.api.nvim_win_close(win, false)
    end
  end

  return keep
end

return M
