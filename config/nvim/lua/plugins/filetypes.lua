return {
  {
    'tpope/vim-markdown',
    config = function()
      vim.g.markdown_fenced_languages = {'vim', 'go', 'help'}
    end,
    ft = { "markdown" },
  },

  {
    'elzr/vim-json',
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end,
    ft = { "json" },
  },

  {
    'pearofducks/ansible-vim',
    config = function()
      vim.g.ansible_options = {ignore_blank_lines = 0}
    end,
    -- ft = { "yaml" },
  },

  { 'cespare/vim-toml', ft = { "toml" } },
  { 'jparise/vim-graphql', ft = { "graphql" } },
  { 'pangloss/vim-javascript', ft = { "javascript" } },
  { 'leafgarland/typescript-vim', ft = { "typescript" } },
  { 'guns/vim-clojure-static', ft = { "clojure" } },
  { 'Olical/conjure', ft = {'clojure'} },
  { 'eraserhd/parinfer-rust', build = 'cargo build --release', ft = { "clojure", "lisp" } },
  { 'vim-python/python-syntax', ft = {'python'} },
  { 'exu/pgsql.vim', ft = {'sql'} },
  { 'lervag/vimtex', ft = { 'tex', 'latex' } },
  { 'othree/html5.vim', ft = 'html' },
}
