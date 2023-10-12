local ts_config = {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "ruby" },
  },

  indent = {
    enable = false,
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
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
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
    'natw/ts-yamlpath.nvim',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('nvim-treesitter.install').update()
      require('nvim-treesitter.configs').setup(ts_config)
      require('utils').map('n', '_', function() require("ts").statusline() end)
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
