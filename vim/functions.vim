function! GitFZF()
  let l:git_root = system('git rev-parse --show-toplevel 2> /dev/null')
  call fzf#vim#files(substitute(l:git_root, "\n$", '' ,''))
endfunction

function! EditOrMkFileWithDir(path) abort
  :echo a:path
  if !filereadable(a:path)
    let l:basename = fnamemodify(a:path, ":p:h")
    call mkdir(l:basename, "p")
  endif
  execute 'edit' a:path
endfunction
