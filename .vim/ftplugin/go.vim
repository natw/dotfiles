setlocal tabstop=2
setlocal shiftwidth=2
setlocal noexpandtab

autocmd FileType go autocmd BufWritePre <buffer> Fmt
