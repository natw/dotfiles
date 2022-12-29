return {
  { 'natw/vim-railscasts', lazy=false },
  'nvim-lua/plenary.nvim',


  'natw/nvim-hover-doc-url',



  'seblj/nvim-echo-diagnostics',

  -- markup languages
  'othree/html5.vim',
  {
    'tpope/vim-markdown',
    config = function()
      vim.g.markdown_fenced_languages = {'vim', 'go', 'help'}
    end,
  },
  'cespare/vim-toml',
  'jparise/vim-graphql',

  {
    'elzr/vim-json',
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end,
  },
  {
    'pearofducks/ansible-vim',
    config = function()
      vim.g.ansible_options = {ignore_blank_lines = 0}
    end,
  },

  -- javascript et al
  'pangloss/vim-javascript',
  'leafgarland/typescript-vim',
  -- 'reasonml-editor/vim-reason-plus'
  -- 'rescript-lang/vim-rescript'
  -- 'kchmck/vim-coffee-script', { 'for': 'coffee' }
  -- 'posva/vim-vue'

  'mfussenegger/nvim-dap',

  -- clojure
  -- 'tpope/vim-fireplace'
  'guns/vim-clojure-static', -- dunno if this is actually good, or even has an effect
  'junegunn/rainbow_parentheses.vim',
  -- 'vim-scripts/paredit.vim'
  -- 'clojure-vim/async-clj-omni'
  {
    'Olical/conjure',
    ft = {'clojure'},
  },

  {
    'eraserhd/parinfer-rust',
    build = 'cargo build --release',
  },
  {
    'vim-python/python-syntax',
    ft = {'python'},
  },
  {
    'exu/pgsql.vim',
    ft = {'sql'},
  },

  'towolf/vim-helm',
  -- 'keith/swift.vim', { 'for': 'swift' }
  -- 'OrangeT/vim-csharp'
  -- 'zah/nim.vim', { 'for': 'nim' }
  -- 'baabelfish/nvim-nim', { 'for': 'nim' }
  -- 'lervag/vimtex'
  -- 'elixir-lang/vim-elixir'
  -- 'elixir-editors/vim-elixir'
  -- 'sudar/vim-arduino-syntax'


  -- everything else

  'mileszs/ack.vim',

  'nathanaelkane/vim-indent-guides',

  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-speeddating',
  'tpope/vim-apathy',

  {
    'rrethy/vim-hexokinase',
    build = 'make hexokinase',
    config = function()
      vim.g.Hexokinase_highlighters = {'backgroundfull'}
      vim.g.Hexokinase_palettes = {'plugin/vim_colorscheme_palette.json'}
    end
  },

  -- 'hkupty/iron.nvim'
  -- 'mtikekar/nvim-send-to-term'

  { dir = '/opt/homebrew/opt/fzf' },
  'junegunn/fzf.vim',
  -- 'junegunn/vader.vim'

  -- 'dense-analysis/ale' -- I guess this still has some uses?

  -- '~/src/vim-fuzzy-emoji'
}
