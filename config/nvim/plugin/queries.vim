function! s:windows()
  lua package.loaded["windows"] = nil
  lua require("windows").windows()
endfunction
function! s:queries()
  lua package.loaded["queries"] = nil
  lua require("queries").queries()
endfunction

" nnoremap <silent> <leader>e :call <SID>queries()<cr>
nnoremap <silent> <leader>e :call <SID>windows()<cr>
