setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" vim-go is overriding this...
setlocal updatetime=200

" call deoplete#enable()

:command! A GoAlternate

nnoremap tt :GoInfo<cr>
nnoremap tT :GoDefType<cr>

nnoremap <leader>gt :GoDeclsDir<cr>



" let g:go_debug = ['lsp']
