local M = {}

M.goto_line_at_same_indent = function(direction)
  local count = vim.v.count
  local startingLineNum, startingColumn = unpack(vim.api.nvim_win_get_cursor(0))
  local finalLine
  if direction == 1 then
    finalLine = vim.fn.line("$")
  else
    finalLine = 0
  end
  local startingIndent = vim.fn.indent(".")

  for lineNum = startingLineNum + direction, finalLine, direction do
    local thisIndent = vim.fn.indent(lineNum)
    if thisIndent == startingIndent then
      local lineText = vim.api.nvim_buf_get_lines(0, lineNum - 1, lineNum, false)[1]
      if lineText ~= nil and vim.trim(lineText) ~= "" then
        vim.api.nvim_win_set_cursor(0, { lineNum, startingColumn })
        count = count - 1
        if count < 1 then
          break
        end
      end
    end
  end
end

M.goto_prev_line_at_same_indent = function()
  M.goto_line_at_same_indent(-1)
end

M.goto_next_line_at_same_indent = function()
  M.goto_line_at_same_indent(1)
end

---

M.ext_select_indent = function(around)
  local start_indent = vim.fn.indent(vim.fn.line("."))
  local blank_line_pattern = "^%s*$"

  if string.match(vim.fn.getline("."), blank_line_pattern) then
    return
  end

  if vim.v.count > 0 then
    start_indent = start_indent - vim.o.shiftwidth * (vim.v.count - 1)
    if start_indent < 0 then
      start_indent = 0
    end
  end
  vim.cmd("normal! V")

  local prev_line = vim.fn.line(".") - 1
  local prev_blank_line = function(line)
    return string.match(vim.fn.getline(line), blank_line_pattern)
  end
  while prev_line > 0 and (prev_blank_line(prev_line) or vim.fn.indent(prev_line) >= start_indent) do
    print("going up!")
    local ln, _ = unpack(vim.api.nvim_win_get_cursor(0))
    print("on line " .. ln)
    vim.cmd("-")
    prev_line = vim.fn.line(".") - 1
  end
  if around then
    vim.cmd("-")
  end

  vim.cmd("normal! V")

  local next_line = vim.fn.line(".") + 1
  local next_blank_line = function(line)
    return string.match(vim.fn.getline(line), blank_line_pattern)
  end
  local last_line = vim.fn.line("$")
  while next_line <= last_line and (next_blank_line(next_line) or vim.fn.indent(next_line) >= start_indent) do
    -- vim.cmd("+")
    next_line = vim.fn.line(".") + 1
  end
  -- if around then
  --   vim.cmd("+")
  -- end
end

M.find_furthest_line_at_same_indent = function(direction, around)
  local startingIndent = vim.fn.indent(".")
  local startingLineNum, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local finalLine

  if direction == 1 then
    finalLine = vim.fn.line("$")
  else
    finalLine = 0
  end

  for lineNum = startingLineNum, finalLine, direction do
    local thisIndent = vim.fn.indent(lineNum)
    if thisIndent ~= startingIndent then
      if around then
        return lineNum
      else
        return lineNum - direction
      end
    end
  end
end

M.select_indent = function(around)
  vim.cmd([[ normal! V ]])

  local firstLine = M.find_furthest_line_at_same_indent(-1, around)
  local finalLine = M.find_furthest_line_at_same_indent(1, around)

  vim.api.nvim_win_set_cursor(0, { firstLine, 3 })
  -- when doing a visual mode selection, I guess it starts in visual mode,
  -- so moving up then down doesn't get anything above the starting position
  -- there has to be a better way
  vim.cmd([[ normal! 0V ]])
  vim.cmd([[ normal! 0V ]])

  vim.api.nvim_win_set_cursor(0, { finalLine, 3 })
end

return M
