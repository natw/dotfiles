setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal list


" let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_checkers = []

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']


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
" map ,tt :!ruby -I test %<cr>
" run test or context under cursor
" map ,ts :execute ":!" . MakeTestCmd()<cr>
" copy command to run current test to clipboard
map ,ct :execute "call setreg('*', '" . expand(MakeTestCmd()) . "')"<cr>

map ,a :vsp<cr>:A<cr>


" function! s:TmuxCurrentWindow()
    " return system('tmux display-message -p "#{window_index}"')
" endfunction

" function! s:TmuxCurrentPane()
    " return system('tmux display-message -p "#{pane_index}"')
" endfunction

" let g:tslime = {}
" let g:tslime['window'] = <SID>TmuxCurrentWindow()

" let panes = system("tmux list-panes | sed -e 's/:.*$//'")
" if len(panes) == 2

" endif


let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map ,rt :call RunCurrentSpecFile()<CR>
map ,rn :call RunNearestSpec()<CR>
map ,rl :call RunLastSpec()<CR>
map ,ra :call RunAllSpecs()<CR>
