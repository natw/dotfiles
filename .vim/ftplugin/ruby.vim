setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
setlocal smartindent

setlocal listchars=tab:»·,trail:·
setlocal list

map ,tt :!ruby %<cr>

function! GetDesc()
  let should_line_num = search("^\\s*\\(should\\|context\\) [\"'].\\+[\"'] do$", "Wbnc")
  if (should_line_num == 0)
    return ""
  endif
  let should_line = getline(should_line_num)
  let desc = matchstr(should_line, "^\\s*\\(should\\|context\\) [\"']\\zs.*\\ze[\"'] do$")
  return desc
endfunction

function! RunCurrentTest()
  let desc = GetDesc()
  let cmd = ":!ruby %"
  if (desc != "")
    let cmd .= " -n \"/"
    let cmd .= desc
    let cmd .= "/\""
  endif
  " let cmd .= "<cr>"
  execute cmd
endfunction

map ,ts :call RunCurrentTest()<cr>
