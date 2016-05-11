let g:neoterm_position = 'vertical'

au VimEnter,BufRead,BufNewFile *.clj call neoterm#repl#set('lein repl')

" let g:neomake_clojure_enabled_makers = ['eastwood']
" let g:neomake_clojure_eastwood_maker = {
      " \ 'exe': 'lein',
      " \ 'args': ['eastwood'],
      " \ 'errorformat':
      " \ '** %s %f:%l: %m,' .
      " \ '%f:%l: warning: %m'
      " \ }
