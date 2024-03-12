return {
  {
    'tpope/vim-markdown',
    config = function()
      vim.g.markdown_fenced_languages = { 'vim', 'go', 'help' }
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
    'hashivim/vim-terraform',
    ft = 'terraform',
    config = function()
      vim.g.terraform_fmt_on_save = 0
    end,
  },

  {
    'pearofducks/ansible-vim',
    config = function()
      vim.g.ansible_options = { ignore_blank_lines = 0 }
    end,
    -- ft = { "yaml" },
  },

  -- {
  --   "AbstractMachinesLab/tree-sitter-sexp",
  --   -- build = "tree-sitter generate && tree-sitter test",
  -- },

  { 'cespare/vim-toml', ft = { "toml" } },
  { 'jparise/vim-graphql', ft = { "graphql" } },
  { 'pangloss/vim-javascript', ft = { "javascript" } },
  { 'leafgarland/typescript-vim', ft = { "typescript" } },
  { 'guns/vim-clojure-static', ft = { "clojure" } },
  { 'Olical/conjure', ft = { 'clojure' } },
  { 'eraserhd/parinfer-rust', ft = { "clojure", "lisp" }, build = 'cargo build --release' },
  { 'vim-python/python-syntax', ft = { 'python' } },
  { 'exu/pgsql.vim', ft = { 'sql' } },
  { 'lervag/vimtex', ft = { 'tex', 'latex' } },
  { 'othree/html5.vim', ft = 'html' },
  { 'vim-ruby/vim-ruby', ft = 'ruby' },
}
