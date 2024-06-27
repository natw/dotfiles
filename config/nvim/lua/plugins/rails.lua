return {
  {
    'tpope/vim-rails',
    ft = { "ruby" },
    config = function()
      vim.g.rails_statusline = 1
      vim.g.rails_modelines = 1
      vim.g.rails_no_abbreviations = 1
    end,
  }
}
