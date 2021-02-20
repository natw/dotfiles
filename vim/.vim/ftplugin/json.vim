" setlocal equalprg=python\ -m\ json.tool
setlocal equalprg=jq\ -rM\ '.'
setlocal shiftwidth=2
syntax match Comment +\/\/.\+$+
