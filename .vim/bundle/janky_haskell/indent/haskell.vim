setlocal include=^import\\s*\\(qualified\\)\\?\\s*
setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.'
setlocal suffixesadd=hs,lhs,hsc,hsx

setlocal indentexpr=Indent(v:lnum)
setlocal indentkeys=!^F,o,O


function! Indent(lnum) " {{{
  let l:line = getline(a:lnum - 1)

  if l:line =~# '^\s*$'
    return 0
  endif

  let l:indent = indent(a:lnum - 1)

  if l:line =~# '^data\>.*=.\+'
    let l:indent = match(l:line, '=')

  elseif l:line =~# '^data\>[^=]\+\|^class\>\|^instance\>'
    let l:indent = &shiftwidth * 2

  elseif l:line =~# '^newtype\>.*=.\+'
    let l:indent = match(l:line, '=') + 2

  elseif l:line =~# '^\k\+.*=\s*\%(do\)\?$'
    let l:indent = &shiftwidth * 2

  elseif l:line =~# '\[[^\]]*$'
    let l:indent = match(l:line, '\[')

  elseif l:line =~# '{[^}]*$'
    let l:indent = match(l:line, '{')

  elseif l:line =~# '([^)]*$'
    let l:indent = match(l:line, '(')

  elseif l:line =~# '\<case\>.*\<of$'
    let l:indent = match(l:line, '\<case\>') + &shiftwidth

  elseif l:line =~# '\<case\>.*\<of\>'
    let l:indent = match(l:line, '\<of\>') + 3

  elseif l:line =~# '\<if\>.*\<then\>.*\%(\<else\>\)\@!'
    let l:indent = match(l:line, '\<then\>')

  elseif l:line =~# '\<if\>'
    let l:indent = match(l:line, '\<if\>') + &shiftwidth

  elseif l:line =~# '\<\%(do\|let\|where\|in\|then\|else\)$'
    let l:indent = indent(a:lnum - 1) + &shiftwidth

  elseif l:line =~# '\<do\>'
    let l:indent = match(l:line, '\<do\>') + 3

  elseif l:line =~# '\<let\>.*\s=$'
    let l:indent = match(l:line, '\<let\>') + 4 + &shiftwidth

  elseif l:line =~# '\<let\>'
    let l:indent = match(l:line, '\<let\>') + 4

  elseif l:line =~# '\<where\>'
    let l:indent = match(l:line, '\<where\>') + 6

  elseif l:line =~# '\s=$'
    let l:indent = indent(a:lnum - 1) + &shiftwidth

  endif

  if synIDattr(synIDtrans(synID(a:lnum - 1, l:indent, 1)), 'name')
    \ =~# '\%(Comment\|String\)$'
    return indent(a:lnum - 1)
  endif

  return l:indent
endfunction " }}}
