setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

" vim-go is overriding this...
setlocal updatetime=200

call deoplete#enable()

:command! A GoAlternate

nnoremap tt :GoInfo<cr>

nnoremap <leader>gt :GoDeclsDir<cr>

nnoremap <buffer> <silent> <c-t><c-]> :<C-u>call go#def#Jump("tab")<cr>
