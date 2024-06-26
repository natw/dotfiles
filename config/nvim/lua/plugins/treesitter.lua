local ts_config = {
  ensure_installed = "all",
  ignore_install = { "phpdoc", "wing" }, -- why did I do this?

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
      init_selection = "<s-cr>",
      scope_incremental = "<tab>",
      node_incremental = "<s-cr>",
      -- node_decremental = '<c-cr>',
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },

  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
}

return {
  {
    "natw/ts-yamlpath.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.install").update()
      require("nvim-treesitter.configs").setup(ts_config)
    end,
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
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
  },

  {
    "nvim-treesitter/playground",
    keys = {
      {
        "<leader>hi",
        ":TSHighlightCapturesUnderCursor<cr>",
        { desc = "Highlight TS Captures", noremap = true, silent = true },
      },
    },
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  },
}
