" note: look in autoload/ for function definitions

" my muscle memory for ctrl-c is strong, but I want the InsertLeave autocmd
inoremap <c-c> <esc>

" ^P toggles paste mode (from insert mode)
nmap <C-p> :set paste!<CR>:set paste?<CR>

" ctrl-h for previous tab
nmap <C-h> gT
" ctrl-L for next tab
nmap <C-l> gt

" commenting
" gc is powered by the vim-commentary plugin
map <leader>c gc

" boy. sure wish I had commented what this did
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
:command! -nargs=1 -complete=file EditOrMkFileWithDir :call nat#EditOrMkFileWithDir(<q-args>)
nmap <leader>fe :EditOrMkFileWithDir <C-R>=expand("%:p:h") . "/" <cr>


" command to remove trailing whitespace
:command! Rmsp %s/\s\+$//

" undo tree visualization
nmap <Leader>gu :MundoToggle<CR>

" linewise select previously pasted text
nmap <Leader>v V`]

" switch to previous file
nmap <Leader><Leader> <C-^>

" nnoremap <silent> <CR> :nohlsearch<CR><CR>

nmap ,f :cfirst<cr>
nmap ,c :cc<cr>

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

map <leader>hi :call nat#HighlightingInfo()<cr>

nmap <silent> <c-n> :silent! call diagnostics#NextThing()<cr>

map <leader>t :call nat#GitFZF()<cr>
" let g:fzf_buffers_jump = 1

map <leader>gg :GitGutterToggle<cr>
