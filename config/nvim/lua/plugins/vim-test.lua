return {
  'vim-test/vim-test',
  cmd = { "TestNearest", "TestLast", "TestFile", "TestClass", "TestSuite", "TestVisit" },
  keys = {
    { ",r", ":TestNearest<cr>", desc = "vim-test#TestNearest" },
    { ",R", ":TestLast<cr>", desc = "vim-test#TestLast" },
  },
  init = function()
    vim.cmd('let test#strategy = "neovim"')
  end,
}
