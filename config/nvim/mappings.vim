" mappings that mostly aren't tied to a specific plugin
"
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

" I hit these by mistake a lot
:command! W w
:command! Wq wq
:command! Q q
:command! Vsp vsp
:command! Wa wa

" display the number of occurences of the word under the cursor
nmap <Leader>wc :%s/<c-r><c-w>//gn<CR>

" open (or create) files with pre-filled path relative to current buffer
:command! -nargs=1 -complete=file EditOrMkFileWithDir :call nat#EditOrMkFileWithDir(<q-args>)
nmap <leader>fe :EditOrMkFileWithDir <C-R>=expand("%:p:h") . "/" <cr>

" command to remove trailing whitespace
:command! Rmsp %s/\s\+$//

" linewise select previously pasted text
nmap <Leader>v V`]

" switch to previous file
nmap <Leader><Leader> <C-^>

" nnoremap <silent> <CR> :nohlsearch<CR><CR>

" quickfix navigation
nmap ,f :cfirst<cr>
nmap ,c :cc<cr>

nmap ,t :tabnew<cr>

" ctrl-w ctrl-c closes the current window, but I often hit it intending to
" abort the window action
map <c-w><c-c> <c-[>

map <leader>hi :call nat#HighlightingInfo()<cr>

nmap <silent> <c-n> :silent! call diagnostics#NextThing()<cr>

map <leader>t :call nat#GitFZF()<cr>
