local M = {}

function M.prev_thing()
  if require("windows").is_filetype_open("qf") then
    vim.cmd(":cprev")
  elseif require("windows").is_filetype_open("Trouble") then
    require("trouble").previous({ skip_groups = true, jump = true })
  else
    require("delimited").goto_prev()
    -- vim.diagnostic.goto_prev()
  end
end

function M.next_thing()
  if require("windows").is_filetype_open("qf") then
    vim.cmd(":cnext")
  elseif require("windows").is_filetype_open("Trouble") then
    require("trouble").next({ skip_groups = true, jump = true })
  else
    require("delimited").goto_next()
    vim.diagnostic.goto_next()
  end
end

return M
