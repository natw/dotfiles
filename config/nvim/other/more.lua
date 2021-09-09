require("trouble").setup {
  icons = false
}

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
}
