return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "dmtrKovalenko/fff.nvim",
    build = "cargo build --release",
    opts = {
      keymaps = {
        close = { "<Esc>", "<c-c>" },
        move_up = { "<Up>", "<c-k>", "<c-p>" },
        move_down = { "<Down>", "<c-j>", "<c-n>" },
      },
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("fff").find_in_git_root()
        end,
        desc = "open fff files picker",
      },
    },
  },

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
      {
        "gx",
        function()
          require("hover-doc").visit()
        end,
        "n",
      },
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
        let g:ackprg = 'rg --vimgrep'
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
        { "n", "v" },
      },
      {
        "[l",
        function()
          require("indentnav").goto_prev_line_at_same_indent()
        end,
        { "n", "v" },
      },
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("nvim-ts-context-commentstring").setup({
        enable_autocmd = false,
      })
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
          or get_option(filetype, option)
      end
    end,
  },

  -- now entering the Tim Pope Zone
  { "tpope/vim-fugitive", cmd = "Git" },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
}
