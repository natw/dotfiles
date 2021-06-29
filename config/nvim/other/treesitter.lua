local tsc = require('nvim-treesitter.configs')

tsc.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing

  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
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

  indent = {
    enable = true
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.hcl = {
  install_info = {
    url = vim.fn.expand("~/src/tree-sitter-hcl"), -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "hcl", -- if filetype does not agrees with parser name
  used_by = {"terraform"} -- additional filetypes that use this parser
}
