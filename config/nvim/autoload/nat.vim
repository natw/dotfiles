" I want to be able to just switch to a file without worrying about whether it
" already exists
" <leader>fe
function! nat#EditOrMkFileWithDir(path) abort
  if !filereadable(a:path)
    let l:basename = fnamemodify(a:path, ":p:h")
    call mkdir(l:basename, "p")
  endif
  execute 'edit' a:path
endfunction
