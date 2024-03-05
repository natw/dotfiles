return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  config = {
    auto_attach = true,
    on_attach = function(_)
      vim.keymap.set('n', '<leader>gg', function()
        package.loaded.gitsigns.toggle_signs()
      end, { noremap = true, silent = true })

      vim.keymap.set('n', '<leader>gb', function()
        package.loaded.gitsigns.blame_line({ full = true })
      end, { noremap = true, silent = true })

      vim.keymap.set('n', '<leader>gd', function()
        package.loaded.gitsigns.diffthis()
      end, { noremap = true, silent = true })
    end,
  },
}
