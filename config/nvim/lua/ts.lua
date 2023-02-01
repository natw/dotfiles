local M = {}

function M.statusline()
  print(require('nvim-treesitter.statusline').statusline({
    indicator_size = 150,
    separator = "  ⮕  ",
    type_patterns = { "class", "function", "method", "module" },
  }))
end

local ts_utils = require('nvim-treesitter.ts_utils')

function M.st()
  local current_node = ts_utils.get_node_at_cursor()
  -- local line = ts_utils._get_line_for_node(expr, type_patterns, transform_fn, bufnr)
  -- print(vim.inspect(current_node:type()))
  -- print(vim.inspect(vim.treesitter.query.get_node_text(current_node, 0)))
  -- local a = "abc123qwerty"
  -- print(a:sub(1, 300))

  local n = current_node
  while n do
    local t = vim.treesitter.query.get_node_text(n, 0)
    -- print(n:type(), "  -  ", vim.split(t,"\n")[1]:sub(1, 50))
    print("***", n:type(), "  -  ", t)
    n = n:parent()
  end
end


return M
