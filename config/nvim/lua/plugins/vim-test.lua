return {
  'vim-test/vim-test',
  config = function()
    local r = require("utils")
    r.map("n", ",r", ":TestNearest<cr>")
    r.map("n", ",R", ":TestLast<cr>")
    vim.cmd('let test#strategy = "neovim"')
  end,
}
