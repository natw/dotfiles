return {
  'lewis6991/gitsigns.nvim',
  lazy = true,
  cmd = "Gitsigns",
  keys = {
    { "<leader>gb", function() require('gitsigns').blame_line { full = true } end },
    { "<leader>gd", function() require('gitsigns').diffthis() end }
  },
}
