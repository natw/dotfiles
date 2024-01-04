local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.bufmap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true, buffer = 0 }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.onsave(groupName, callback)
  local group = vim.api.nvim_create_augroup(groupName, { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    group = group,
    callback = callback,
  })
end

return M
