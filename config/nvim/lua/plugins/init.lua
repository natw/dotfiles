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
    ft = { "clojure", "lisp", "racket" },
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

  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = {
      '*',
    },
  },

  {
    "natw/nvim-indentnav",
    dev = true,
    keys = {
      { "]l", function() require("indentnav").goto_next_line_at_same_indent() end, "n" },
      { "[l", function() require("indentnav").goto_prev_line_at_same_indent() end, "n" },
    },
  },

  -- now entering the Tim Pope Zone
  { "tpope/vim-fugitive", cmd = "Git" },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
}
