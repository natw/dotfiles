function! s:something()
  lua package.loaded["windows"] = nil
  lua require("windows").is_filetype_open()
  " lua package.loaded["queries"] = nil
  " lua require("queries").queries()
endfunction

nnoremap <silent> <leader>e :call <SID>something()<cr>
