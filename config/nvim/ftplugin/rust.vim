augroup RUST_FMT
  autocmd! * <buffer=abuf>
  autocmd BufWritePre <buffer=abuf> :silent! lua vim.lsp.buf.format(nil, 1000)
augroup END
