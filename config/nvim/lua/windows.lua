local M = {}

function M.is_qf_open()
  local win_ids = vim.api.nvim_tabpage_list_wins(0)
  for _, win_id in pairs(win_ids) do
    local buf_id = vim.api.nvim_win_get_buf(win_id)
    local ft = vim.bo[buf_id].filetype
    if ft == "qf" then
      return true
    end
  end
  return false
end

return M
