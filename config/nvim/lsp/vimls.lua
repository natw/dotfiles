return {
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  init_options = {
    isNeovim = true,
    indexes = {
      runtimepath = true,
    },
    diagnostic = {
      enable = true,
    },
    suggest = {
      fromVimruntime = true,
      fromRuntimepath = true,
    },
  },
}
