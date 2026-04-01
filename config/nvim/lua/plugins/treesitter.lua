return {
  {
    "natw/ts-yamlpath.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    opts = {
      move = {
        enable = true,
        set_jumps = true,
        goto_previous_start = {
          ["[["] = "@function.outer",
        },
        goto_next_start = {
          ["]]"] = "@function.outer",
        },
      },

      select = {
        enable = true,
        lookahead = true,
        selection_modes = {
          ['@function.inner'] = 'V',
          ['@function.outer'] = 'V',
          ['@block.inner'] = 'V',
          ['@block.outer'] = 'V',
          ['@class.inner'] = 'V',
          ['@class.outer'] = 'V',
        },
      },
    },
    keys = {
      {
        "if",
        function()
          require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
        end,
        mode = { "x", "o" },
      },
      {
        "af",
        function()
          require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
        end,
        mode = { "v", "o" },
      },
      {
        "ib",
        function()
          require "nvim-treesitter-textobjects.select".select_textobject("@block.inner", "textobjects")
        end,
        mode = { "v", "o" },
      },
      {
        "ab",
        function()
          require "nvim-treesitter-textobjects.select".select_textobject("@block.outer", "textobjects")
        end,
        mode = { "v", "o" },
      },
      {
        "ic",
        function()
          require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
        end,
        mode = { "x", "o" },
      },
      {
        "ac",
        function()
          require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
        end,
        mode = { "v", "o" },
      },
    }
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSContext" },
  },
}
