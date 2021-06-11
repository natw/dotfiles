" is the quickfix window open?
function! s:IsQFOpen() abort
  return !empty(filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"'))
endfunction

" don't make me think or care. If the quickfix window is open, ^n should go to
" the next thing there. Else, show me the next error
function! diagnostics#NextThing()
  if s:IsQFOpen()
    :cnext
  elseif len(getqflist()) > 0
    :call LanguageClient#diagnosticsNext()
  else
    :ALENextWrap
  endif
endfunction
