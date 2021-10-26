function! s:queries()
  lua package.loaded["queries"] = nil
  lua require("queries").queries()
endfunction

nnoremap <silent> <leader>e :call <SID>queries()<cr>
