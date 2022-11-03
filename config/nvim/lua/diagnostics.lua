local M = {}

function M.prev_thing()
  if require("windows").is_qf_open() then
    vim.cmd(":cprev")
  else 
    vim .diagnostic.goto_prev()
  end
end

function M.next_thing()
  if require("windows").is_qf_open() then
    vim.cmd(":cnext")
  else
    vim.diagnostic.goto_next()
  end
end

return M
