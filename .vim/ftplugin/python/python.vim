setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=78
setlocal smarttab
setlocal expandtab
setlocal smartindent

setlocal listchars=tab:»·,trail:·
setlocal list

au! BufEnter <buffer> match ErrorMsg /\%80v.*/
au! BufLeave <buffer> match

compiler pylint
map <buffer> <Leader>pl :Pylint<CR>

" t is an alias for work stuff
map <buffer> ,t :!t %<CR>

map <buffer> <leader>pe :call Pep8()<cr>
