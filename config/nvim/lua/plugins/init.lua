return {
  {
    "natw/vim-railscasts",
    lazy = false,
    branch = "main",
    dev = true,
  },

  { "nvim-lua/plenary.nvim" },

  {
    "natw/nvim-hover-doc-url",
    keys = { "gx", "<cmd>lua require('hover-doc').visit()", "n" },
  },
  { "seblj/nvim-echo-diagnostics" },
  { "mfussenegger/nvim-dap" },

  {
    dir = "/opt/homebrew/opt/fzf",
    lazy = false,
  },
  {
    "junegunn/fzf.vim",
    lazy = false,
  },
  {
    "junegunn/rainbow_parentheses.vim",
    cmd = { "RainbowParentheses" },
    ft = { 'clojure', 'lisp', 'racket' },
  },

  {
    "mileszs/ack.vim",
    cmd = "Ack",
    init = function()
      vim.cmd([[
        if executable('ag')
          let g:ackprg = 'ag --vimgrep'
        endif
      ]])
    end,
  },

  -- { 'folke/lsp-colors.nvim', lazy = false },

  -- TODO: try https://github.com/NvChad/nvim-colorizer.lua instead
  {
    "rrethy/vim-hexokinase",
    build = "make hexokinase",
    init = function()
      vim.g.Hexokinase_v2 = true
      vim.g.Hexokinase_palettes =
        { vim.fn.expand("<script>:p:h") .. "/lua/plugins/hexokinase_colorscheme_palette.json" }
      vim.g.Hexokinase_highlighters = { "backgroundfull" }
    end,
    lazy = false,
  },

  -- now entering the Tim Pope Zone
  { "tpope/vim-commentary", lazy = false },
  { "tpope/vim-fugitive", cmd = "Git" },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
}
