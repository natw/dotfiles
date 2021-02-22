" let g:elm_setup_keybindings = 0
" let g:elm_format_autosave = 1
" let g:elm_format_fail_silently = 1

setlocal softtabstop=4
setlocal shiftwidth=4

nmap ,m :!elm make %<cr>

let g:deoplete#enable_at_startup = 1

nnoremap tt :ElmShowDocs<cr>

" function! FixExposing()
"   execute ":1s/exposing (.*/exposing (..)/|''"
" endfunction

" autocmd BufWritePre <buffer> call FixExposing()
