set completeopt-=longest
set completeopt+=menu
set completeopt+=noinsert
set completeopt+=noselect

let g:deoplete#enable_at_startup = 1

" setting refresh_always to false eliminates cursor flicker with menu open
if exists("*deoplete#custom#option")
  call deoplete#custom#option({
        \ 'auto_complete': v:true,
        \ 'auto_complete_popup': 'manual',
        \ 'smart_case': v:true,
        \ 'omni_patterns': { 'go': '[^. *\t]\.\w*' },
        \ 'refresh_always': v:false,
        \ })
endif

let deoplete#tag#cache_limit_size = 5000000

" if !exists('g:deoplete#keyword_patterns')
"   let g:deoplete#keyword_patterns = {}
" endif

let g:deoplete#sources#go#pointer = 1
" remaps some keys in the case that the completion menu is visible
" tab and ctrl-j should cycle through the completions
" ctrl-k should cycle backwards
" and enter should confirm the selected completion without inserting a newline
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr> <c-r> pumvisible() ? "\<c-r><c-r>" : "\<c-r>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
" inoremap <expr> <cr> pumvisible() ? "\<cr>\<cr>" : "\<cr>"
