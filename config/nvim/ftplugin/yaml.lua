-- setlocal foldmethod=indent
-- setlocal foldlevel=9999

local nt = function(node)
  return vim.trim(require('vim.treesitter.query').get_node_text(node, 0))
end

local transform_line = function(_, node)
  local typ = node:type()
  if typ == "block_mapping_pair" then
    return string.format(".%s", nt(node:named_child(0)))
  elseif typ == "block_sequence_item" then
    local id = node:id()
    local parent = node:parent()
    local i = 0
    for cn in parent:iter_children() do
      if cn:id() == id then
        return string.format("[%d]", i)
      end
      i = i + 1
    end
  end
end
local function yaml_statusline()
  local sl = require('nvim-treesitter.statusline').statusline({
    separator = "",
    type_patterns = { "block_mapping_pair", "block_sequence_item" },
    transform_fn = transform_line,
  })
  if vim.startswith(sl, ".") then
    print(sl:sub(2, 123))
  else
    print(sl)
  end
end

vim.keymap.set('n', '_', yaml_statusline)
