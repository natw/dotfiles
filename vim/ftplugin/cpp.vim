setlocal commentstring=//\ %s

if !exists('*SwitchSourceHeader')
  function! SwitchSourceHeader() abort
    if (expand("%:e") == "cpp")
      find %:t:r.h
    else
      find %:t:r.cpp
    endif
  endfunction

  :command! A :call SwitchSourceHeader()
endif
