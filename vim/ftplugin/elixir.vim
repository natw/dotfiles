setlocal list

let g:neomake_elixir_enabled_makers = ['mix']
let g:neomake_elixir_mix_maker = {
      \ 'args': ['compile'],
      \ 'errorformat':
      \ '** %s %f:%l: %m,' .
      \ '%f:%l: warning: %m'
      \ }
