" setlocal equalprg=python\ -m\ json.tool
setlocal equalprg=jq\ -rM\ '.'
setlocal shiftwidth=2
syntax match Comment +\/\/.\+$+

" de-uglify json files
" nmap <Leader>jl :%!json_xs -f json -t json-pretty<cr>
