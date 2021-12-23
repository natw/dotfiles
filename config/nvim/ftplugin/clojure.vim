let g:neoterm_position = 'vertical'

nmap ,j (,Wa<space><esc>i
nmap ,ww ,Wa<space><left>

let g:rainbow#blacklist = ['#000000']
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
:RainbowParentheses

function! CLJPreWrite()
  " silent let g:paredit_mode = "0"
  lua vim.lsp.buf.formatting_sync(nil, 1000)
  " silent let g:paredit_mode = "1"
endfunction

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

function! PareditToggle()
  if g:paredit_mode == "1"
    silent let g:paredit_mode = "0"
    echo "Disabling paredit"
  elseif g:paredit_mode == "0"
    silent let g:paredit_mode = "1"
    echo "Enabling paredit"
  endif
endfunction
nnoremap <c-p> :call PareditToggle()<cr>

augroup CLJ
	autocmd!
  autocmd BufWritePre *.clj :call CLJPreWrite()
  " autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
  " autocmd CursorMoved <buffer> echom "hey"
augroup END
