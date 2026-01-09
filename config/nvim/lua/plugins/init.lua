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
    },
    lazy = false,
    keys = {
      {
        "<leader>t",
        function()
          require("fff").find_files()
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
    event = "VeryLazy",
    opts = {
      lazy_load = true,
    },
  },

  -- {
  --   "natw/nvim-indentnav",
  --   dev = true,
  --   keys = {
  --     {
  --       "]l",
  --       function()
  --         print("what")
  --         require("indentnav").goto_next_line_at_same_indent()
  --       end,
  --       { "n", "v" },
  --     },
  --     {
  --       "[l",
  --       function()
  --         require("indentnav").goto_prev_line_at_same_indent()
  --       end,
  --       { "n", "v" },
  --     },
  --     -- {
  --     --   "il",
  --     --   function()
  --     --     print("func 1")
  --     --     require("indentnav").selectInner()
  --     --   end,
  --     --   { "x", "o" },
  --     -- },
  --     -- {
  --     --   "al",
  --     --   function()
  --     --     print("func 2")
  --     --     require("indentnav").selectOuter()
  --     --   end,
  --     --   { "x", "o" },
  --     -- },
  --   },
  -- },

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
