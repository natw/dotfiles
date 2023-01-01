return {
  'vim-test/vim-test',
  cmd = { "TestNearest", "TestLast", "TestFile", "TestClass", "TestSuite", "TestVisit" },
  config = function()
    local r = require("utils")
    r.map("n", ",r", ":TestNearest<cr>")
    r.map("n", ",R", ":TestLast<cr>")
    vim.cmd('let test#strategy = "neovim"')
  end,
}
