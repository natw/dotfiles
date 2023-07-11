local u = require 'nvim-treesitter.ts_utils'

local M = {}

-- true if node or any parents has matching type, otherwise false
local function has_parent_type(node, type_name)
  if node == nil then
    return false
  end
  if node:type() == type_name then
    return true
  end
  return has_parent_type(node:parent(), type_name)
end

function M.queries()
  local node = u.get_node_at_cursor(0)
  print(u.get_node_range(node))
  print("hey")
  -- for key,value in pairs(getmetatable(node)) do
  --   print(key, value)
  -- end
  print("type: ", node:type())
  print(node:id())
  -- for key, value in pairs(u.get_node_text(node)) do
  --   print(key, value)
  -- end
  print(vim.inspect(has_parent_type(node, "argument_list")))
end

return M
