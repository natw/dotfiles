return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  cmd = "Gitsigns",
  config = {
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      -- get blame info for that line
      vim.keymap.set('n', '<leader>gb', function()
        gs.blame_line{full=true}
      end, { buffer = bufnr })

      -- see a proper diff of the whole file
      vim.keymap.set('n', '<leader>gd', function()
        gs.diffthis()
      end, { buffer = bufnr })
    end
  },
}
