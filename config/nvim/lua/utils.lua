local M = {}

function M.onsave(groupName, callback)
  local group = vim.api.nvim_create_augroup(groupName, { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    group = group,
    callback = callback,
  })
end

return M
