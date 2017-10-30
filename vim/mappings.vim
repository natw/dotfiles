" ^P toggles paste mode (from insert mode)
imap <C-p> :set paste!<CR>:set paste?<CR>

" ctrl-h for previous tab
nmap <C-h> gT
" ctrl-L for next tab
nmap <C-l> gt

" I hit these by mistake a lot
:command! W w
:command! Wq wq
:command! Q q
:command! Vsp vsp

" display the number of occurences of the word under the cursor
nmap <Leader>wc :%s/<c-r><c-w>//gn<CR>


" open files with path relative to current buffer
nmap <Leader>fe :e <C-R>=expand("%:p:h") . "/" <CR>

" here's some nonsense for debugging syntax highlighting
nmap <Leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" command to remove trailing whitespace
:command! Rmsp %s/\s\+$//

" I like using ^O for scrolling through completion options
imap <C-o> <C-p>

" undo tree visualization
nmap <Leader>gu :MundoToggle<CR>

" linewise select previously pasted text
nmap <Leader>v V`]

" de-uglify json files
nmap <Leader>jl :%!json_xs -f json -t json-pretty<cr>

" switch to last file
nmap <Leader><Leader> <C-^>

nnoremap <silent> <CR> :nohlsearch<CR><CR>

nmap <c-n> :cn<cr>

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