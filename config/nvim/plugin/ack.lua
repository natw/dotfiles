local map = require('utils').map

-- normal/visual mode commands for using :Ack or :Ag for finding things in the current project

local function ag_cmd(needle)
  return "Ag " .. needle
end

local function ack_cmd(needle)
  return "Ack '" .. needle .. "'"
end

-- the max/min bits are because `getpos` is aware of what direction you moved
-- to select the text. So if you hit `v` and then move the cursor left,
-- `start_col` will be greater than `end_col`
local function selected_text()
  local _, start_row, start_col = unpack(vim.fn.getpos('v'))
  local _, end_row, end_col = unpack(vim.fn.getpos('.'))
  return table.concat(vim.api.nvim_buf_get_text(0, math.min(start_row, end_row) - 1, math.min(start_col, end_col) - 1, math.max(start_row, end_row) - 1, math.max(start_col, end_col), {}), '')
end

local function cursor_text()
  return vim.fn.expand("<cword>")
end

local function find_text(cmd_func, text_func)
  return function()
    vim.cmd(cmd_func(text_func()))
  end
end

map('v', '<leader>ag', find_text(ag_cmd, selected_text))
map('v', '<leader>ac', find_text(ack_cmd, selected_text))
map('n', '<leader>ag', find_text(ag_cmd, cursor_text))
map('n', '<leader>ac', find_text(ack_cmd, cursor_text))
