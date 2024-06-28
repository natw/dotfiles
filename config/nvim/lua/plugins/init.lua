return {
  {
    "natw/vim-railscasts",
    lazy = false,
    priority = 1000,
    branch = "main",
    dev = true,
  },

  -- { "nvim-lua/plenary.nvim" },

  {
    "natw/nvim-hover-doc-url",
    keys = {
      { "gx", function() require("hover-doc").visit() end, "n" },
    },
  },

  { "mfussenegger/nvim-dap" },

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
    opts = {
      "*",
    },
  },

  {
    "natw/nvim-indentnav",
    dev = true,
    keys = {
      {
        "]l",
        function()
          require("indentnav").goto_next_line_at_same_indent()
        end,
        "n",
      },
      {
        "[l",
        function()
          require("indentnav").goto_prev_line_at_same_indent()
        end,
        "n",
      },
    },
  },

  -- now entering the Tim Pope Zone
  { "tpope/vim-fugitive", cmd = "Git" },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
}
