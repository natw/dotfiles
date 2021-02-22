let g:neoterm_position = 'vertical'

nmap <c-\><c-e> :Eval<cr>
vmap <c-\><c-e> :Eval<cr>
nmap <c-\><c-\><c-e> :%Eval<cr>
nmap ,j (,Wa<space><esc>i

let g:rainbow#blacklist = ['#000000']
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
:RainbowParentheses

call g:deoplete#custom#option('keyword_patterns', {
      \ 'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*',
      \})

" :call fireplace#register_port_file(expand('~/.lein/repl-port'), '/')
