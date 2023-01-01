" let g:elm_setup_keybindings = 0
" let g:elm_format_autosave = 1
" let g:elm_format_fail_silently = 1

setlocal softtabstop=4
setlocal shiftwidth=4

nmap ,m :!elm make %<cr>

nnoremap tt :ElmShowDocs<cr>

" function! FixExposing()
"   execute ":1s/exposing (.*/exposing (..)/|''"
" endfunction

" autocmd BufWritePre <buffer> call FixExposing()
