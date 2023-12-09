let g:pylint_onwrite = 0
" let g:python3_host_prog=$HOME . "/.local/vim-venv/bin/python"

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
" setlocal textwidth=78
setlocal list

nmap ,nm Go<c-d><c-d><c-d><c-d><c-d><c-m>if __name__ == "__main__":<c-m>main()<c-c>
