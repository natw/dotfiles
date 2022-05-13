" nnoremap <silent> <leader>e :VipsqlSendCurrentLine<cr>
" vnoremap <silent> <leader>e :VipsqlSendSelection<cr>
" nnoremap <silent> <leader>ea :VipSendBuffer<cr>

" let maplocalleader = ','

" nnoremap <silent> <leader>e <Plug>(iron-send-line)
nnoremap <silent> <localleader>e vip<Plug>(iron-visual-send)
vnoremap <silent> <localleader>e <Plug>(iron-visual-send)
nnoremap <silent> <localleader>ee vip<Plug>(iron-visual-send)
vnoremap <silent> <localleader>ee <Plug>(iron-visual-send)
nnoremap <silent> <localleader>ec <Plug>(iron-interrupt)
