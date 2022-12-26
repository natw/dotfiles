" mappings that mostly aren't tied to a specific plugin
"
" note: look in autoload/ for function definitions

" my muscle memory for ctrl-c is strong, but I want the InsertLeave autocmd
inoremap <c-c> <esc>

" ^P toggles paste mode (from insert mode)
" inoremap <silent> <C-p> :set paste!<CR>:set paste?<CR>

" ctrl-h for previous tab
nnoremap <C-h> gT
" ctrl-L for next tab
nnoremap <C-l> gt

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
nnoremap <Leader>wc :%s/<c-r><c-w>//gn<CR>

" open (or create) files with pre-filled path relative to current buffer
:command! -nargs=1 -complete=file EditOrMkFileWithDir :call nat#EditOrMkFileWithDir(<q-args>)
nnoremap <leader>fe :EditOrMkFileWithDir <C-R>=expand("%:p:h") . "/" <cr>

" command to remove trailing whitespace
:command! Rmsp %s/\s\+$//

" linewise select previously pasted text
nnoremap <Leader>v V`]

" switch to previous file
nnoremap <Leader><Leader> <C-^>

" nnoremap <silent> <CR> :nohlsearch<CR><CR>

" quickfix navigation
nnoremap ,f :cfirst<cr>
nnoremap ,c :cc<cr>

nnoremap ,t :tabnew<cr>

" ctrl-w ctrl-c closes the current window, but I often hit it intending to
" abort the window action
noremap <c-w><c-c> <c-[>

noremap <leader>hi :TSHighlightCapturesUnderCursor<cr>

lua <<EOF
  vim.api.nvim_set_keymap("n", "<c-n>", "<cmd> lua require('diagnostics').next_thing()<cr>", {noremap=true, silent=true})
  vim.api.nvim_set_keymap("n", "<c-p>", "<cmd> lua require('diagnostics').prev_thing()<cr>", {noremap=true, silent=true})
EOF

nnoremap <leader>t :call nat#GitFZF()<cr>

tnoremap <Esc> <C-\><C-n>
