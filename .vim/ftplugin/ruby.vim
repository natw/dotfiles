setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
setlocal smartindent

setlocal listchars=tab:»·,trail:·
setlocal list


function! GetDesc()
  let should_line_num = search("^\\s*\\(should\\|context\\) [\"'].\\+[\"'] do$", "Wbnc")
  if (should_line_num == 0)
    return ""
  endif
  let should_line = getline(should_line_num)
  let desc = matchstr(should_line, "^\\s*\\(should\\|context\\) [\"']\\zs.*\\ze[\"'] do$")
  return desc
endfunction

function! MakeTestCmd()
  let desc = GetDesc()
  let cmd = "ruby -I test "
  let cmd .= expand('%')
  if (desc != "")
    let cmd .= " -n \"/"
    let cmd .= desc
    let cmd .= "/\""
  endif
  return cmd
endfunction

" run current file
map ,tt :!ruby -I test %<cr>
" run test or context under cursor
map ,ts :execute ":!" . MakeTestCmd()<cr>
" copy command to run current test to clipboard
map ,ct :execute "call setreg('*', '" . expand(MakeTestCmd()) . "')"<cr>

map ,a :vsp<cr>:A<cr>
