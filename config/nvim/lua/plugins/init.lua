return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    opts = {
      keymaps = {
        close = { "<Esc>", "<c-c>" },
        move_up = { "<Up>", "<c-k>", "<c-p>" },
        move_down = { "<Down>", "<c-j>", "<c-n>" },
      },
      layout = {
        prompt_position = 'top',
      },
      debug = {
        enabled = true,
      },
    },
    lazy = false,
    keys = {
      {
        "<leader>t",
        function()
          -- require("fff").find_files()
          require("fff").find_in_git_root()
        end,
        desc = "open fff files picker",
      },
    },
  },

  {
    "ojroques/nvim-lspfuzzy",
    dependencies = {
      { "junegunn/fzf" },
      { "junegunn/fzf.vim" },
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
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      lazy_load = true,
      suppress_deprecation = true,
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
  { "tpope/vim-fugitive",    cmd = "Git" },
  { "tpope/vim-surround",    lazy = false },
  { "tpope/vim-speeddating", lazy = false },
}
