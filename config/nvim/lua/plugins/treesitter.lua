local ts_config = {

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<s-cr>",
      scope_incremental = "<tab>",
      node_incremental = "<s-cr>",
      -- node_decremental = '<c-cr>',
    },
  },
}

return {
  {
    "natw/ts-yamlpath.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    keys = {
      {
        "_",
        function()
          require("ts").statusline()
        end,
        desc = "TreeSitter Statusline",
      },
    },
    cmd = { "TSInstall", "TSUpdate", "TSModuleInfo", "TSDisable" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
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
        config = function()
          vim.keymap.set({ "x", "o" }, "if", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
          end)
          vim.keymap.set({ "v", "o" }, "af", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
          end)
          vim.keymap.set({ "v", "o" }, "ib", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@block.inner", "textobjects")
          end)
          vim.keymap.set({ "v", "o" }, "ab", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@block.outer", "textobjects")
          end)
          vim.keymap.set({ "x", "o" }, "ic", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
          end)
          vim.keymap.set({ "v", "o" }, "ac", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
          end)
        end,
      },
    },
  },
}
