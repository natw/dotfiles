
local ts_config = {
  ensure_installed = "all",
  ignore_install = {"phpdoc"}, -- List of parsers to ignore installing

  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  textobjects = {
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
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
      },
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<cr>',
      scope_incremental = '<tab>',
      node_incremental = '<cr>',
      node_decremental = '<s-cr>',
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  context_commentstring = {
    enable = true
  },
}


return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('nvim-treesitter.install').update()
      require('nvim-treesitter.configs').setup(ts_config)
      require('utils').map('n', '_', '<cmd>lua require("ts").statusline()<cr>')

      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.sexp = {
        install_info = {
          url = "~/.local/share/nvim/lazy/tree-sitter-sexp",
          -- url = "git@github.com:AbstractMachinesLab/tree-sitter-sexp.git",
          files = {"src/parser.c"},
          -- branch = "main",
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = true,
        },
      }
    end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
    },
  },
  {
    'nvim-treesitter/playground',
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  },
}
