let g:neoterm_position = 'vertical'

nmap <c-\><c-e> :Eval<cr>
vmap <c-\><c-e> :Eval<cr>
nmap <c-\><c-\><c-e> vip:Eval<cr>

:RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

let g:neomake_clojure_enabled_makers = ['eastwood']
let g:neomake_clojure_eastwood_maker = {
      \ 'exe': 'lein',
      \ 'args': ['eastwood'],
      \ 'errorformat':
      \ '** %s %f:%l: %m,' .
      \ '%f:%l: warning: %m'
      \ }
