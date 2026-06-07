local M = {}

function M.prev_thing()
  if require("windows").is_filetype_open("qf") then
    vim.cmd(":cprev")
  elseif require("windows").is_filetype_open("Trouble") then
    require("trouble").previous({ skip_groups = true, jump = true })
  else
    vim.diagnostic.jump({ count = -1 })
  end
end

function M.next_thing()
  if require("windows").is_filetype_open("qf") then
    vim.cmd(":cnext")
  elseif require("windows").is_filetype_open("Trouble") then
    require("trouble").next({ skip_groups = true, jump = true })
  else
    vim.diagnostic.jump({ count = 1 })
  end
end

return M
