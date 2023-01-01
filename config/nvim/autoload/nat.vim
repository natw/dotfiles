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

function! nat#GitFZF()
  let l:git_root = system('git rev-parse --show-toplevel 2> /dev/null')
  call fzf#vim#files(substitute(l:git_root, "\n$", '' ,''))
endfunction
