return {
  { 'natw/vim-railscasts', lazy=false }, -- colorscheme
  { 'nvim-lua/plenary.nvim' },
  { 'natw/nvim-hover-doc-url', keys = { "gx", "<cmd>lua require('hover-doc').visit()", "n" } },
  { 'seblj/nvim-echo-diagnostics' },
  { 'mfussenegger/nvim-dap' }, -- debug adapter protocol
  { 'mileszs/ack.vim', cmd = "Ack" },
  { dir = '/opt/homebrew/opt/fzf', lazy = false },
  { 'junegunn/fzf.vim', lazy = false },

  {
    'rrethy/vim-hexokinase',
    build = 'make hexokinase',
    config = function()
      vim.g.Hexokinase_highlighters = {'backgroundfull'}
      vim.g.Hexokinase_palettes = {'plugin/vim_colorscheme_palette.json'}
    end,
    lazy = false,
  },

  -- now entering the Tim Pope Zone
  { 'tpope/vim-commentary', lazy = false },
  { 'tpope/vim-fugitive', cmd = "Git" },
  { 'tpope/vim-surround', lazy = false },
  { 'tpope/vim-speeddating', lazy = false },
}
