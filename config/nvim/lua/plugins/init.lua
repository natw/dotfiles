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
    init = function()
      vim.g.Hexokinase_v2 = true
      vim.g.Hexokinase_palettes = { vim.fn.expand('<script>:p:h') .. '/lua/plugins/hexokinase_colorscheme_palette.json'}
      -- vim.g.Hexokinase_palettes = { '/Users/nat/projects/dotfiles/config/nvim/lua/plugins/hexokinase_colorscheme_palette.json' }
      vim.g.Hexokinase_highlighters = { 'backgroundfull' }

    end,
    lazy = false,
  },

  -- now entering the Tim Pope Zone
  { 'tpope/vim-commentary', lazy = false },
  { 'tpope/vim-fugitive', cmd = "Git" },
  { 'tpope/vim-surround', lazy = false },
  { 'tpope/vim-speeddating', lazy = false },
}
