local tsc = require('nvim-treesitter.configs')

tsc.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing

  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },

  textobjects = {
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
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
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
  }
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.hcl = {
--   install_info = {
--     url = vim.fn.expand("~/src/tree-sitter-hcl"), -- local path or git repo
--     files = {"src/parser.c"}
--   },
--   filetype = "hcl", -- if filetype does not agrees with parser name
--   used_by = {"terraform"} -- additional filetypes that use this parser
-- }
