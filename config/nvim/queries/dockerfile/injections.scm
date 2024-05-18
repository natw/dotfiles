; until https://github.com/nvim-treesitter/nvim-treesitter/issues/6530 is fixed

((shell_command
  (shell_fragment) @injection.content)
  (#set! injection.language "bash")
  (#set! injection.include-children))
