setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal updatetime=200
setlocal foldmethod=indent

:command! A lua require('go_funcs').alternate()


" :command! A GoAlternate

" nnoremap tt :GoInfo<cr>
" nnoremap tT :GoDefType<cr>
" nnoremap ,,d :GoDeclsDir<cr>

nnoremap <leader>rt ot.Run("", func(t *testing.T) {<cr>})<esc>kci"

augroup GO_LSP
	autocmd! * <buffer=abuf>
  autocmd BufWritePre <buffer=abuf> :silent! lua require('go_funcs').format()
  autocmd BufWritePre <buffer=abuf> :silent! lua require('go_funcs').org_imports(3000)
augroup END

" setlocal foldexpr=nvim_treesitter#foldexpr()
