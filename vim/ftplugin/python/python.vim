setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=78

setlocal list

au! BufEnter <buffer> match ErrorMsg /\%79v./
au! BufLeave <buffer> match

compiler pylint
map <buffer> <Leader>pl :Pylint<CR>

map <buffer> <leader>pe :call Pep8()<cr>
