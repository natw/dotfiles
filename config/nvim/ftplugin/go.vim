setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" vim-go is overriding this...
setlocal updatetime=200

" call deoplete#enable()

:command! A GoAlternate

" nnoremap tt :GoInfo<cr>
" nnoremap tT :GoDefType<cr>
" nnoremap ,,d :GoDeclsDir<cr>

nnoremap <leader>rt ot.Run("", func(t *testing.T) {<cr>})<esc>kci"

lua require('hover_doc_link')
nnoremap <silent> gx :call v:lua.hover_doc_link('pkg.go.dev')<cr>

autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
