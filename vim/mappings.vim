" my muscle memory for ctrl-c is strong, but I want the InsertLeave autocmd
inoremap <c-c> <esc>

" ^P toggles paste mode (from insert mode)
nmap <C-p> :set paste!<CR>:set paste?<CR>

" ctrl-h for previous tab
nmap <C-h> gT
" ctrl-L for next tab
nmap <C-l> gt

nmap <leader>q 0f=lli"${<esc>$a}"<esc>

" I hit these by mistake a lot
:command! W w
:command! Wq wq
:command! Q q
:command! Vsp vsp
:command! Wa wa

" display the number of occurences of the word under the cursor
nmap <Leader>wc :%s/<c-r><c-w>//gn<CR>


" open files with path relative to current buffer
" nmap <Leader>fe :e <C-R>=expand("%:p:h") . "/" <cr>
:command! -nargs=1 -complete=file EditOrMkFileWithDir :call EditOrMkFileWithDir(<q-args>)
nmap <leader>fe :EditOrMkFileWithDir <C-R>=expand("%:p:h") . "/" <cr>


" command to remove trailing whitespace
:command! Rmsp %s/\s\+$//

" undo tree visualization
nmap <Leader>gu :MundoToggle<CR>

" linewise select previously pasted text
nmap <Leader>v V`]

" de-uglify json files
nmap <Leader>jl :%!json_xs -f json -t json-pretty<cr>

" switch to last file
nmap <Leader><Leader> <C-^>

" nnoremap <silent> <CR> :nohlsearch<CR><CR>

nmap ,f :cfirst<cr>
nmap ,c :cc<cr>

" nmap <c-n> :cn<cr>

nmap ,t :tabnew<cr>

nmap <leader>sp :set spell!<cr>

" what?
:command! Only :only | :tabonly

" I forget what this normally does, but I never want that
map <c-w><c-c> <c-[>

" in normal mode, ^H should to to previous tab
" vim used to know the difference between ^H and <bs>.  whatever
" I probably just messed up iTerm somehow
nmap <bs> gT

map ,m :make<cr>


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

map <leader>hi :call HighlightingInfo()<cr>
" map <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""""""""""""
" is the quickfix window open?
function! s:IsQFOpen() abort
  return !empty(filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"'))
endfunction

" don't make me think or care. If the quickfix window is open, ^n should go to
" the next thing there. Else, show me the next error
function! NextThing()
  if s:IsQFOpen()
    :cnext
  elseif len(getqflist()) > 0
    :call LanguageClient#diagnosticsNext()
  else
    :ALENextWrap
  endif
endfunction

nmap <silent> <c-n> :silent! call NextThing()<cr>
""""""""""""
