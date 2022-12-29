local u = require("utils")

return {
  'junegunn/vim-easy-align',
  config = function()
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    u.map("x", "ga", "<Plug>(EasyAlign)")
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    u.map("n", "ga", "<Plug>(EasyAlign)")
  end,
}
