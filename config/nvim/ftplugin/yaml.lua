vim.keymap.set('n', '_', function()
  require('ts-yamlpath').path_at_cursor()
end)
vim.treesitter.start()
