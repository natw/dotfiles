setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=78
setlocal list

let g:neomake_python_enabled_makers = ['flake8']

au! BufEnter <buffer> match ErrorMsg /\%79v./
au! BufLeave <buffer> match
