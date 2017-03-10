setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let g:neomake_javascript_enabled_makers = ['standard']

nnoremap <leader>sf :!standard % --fix --plugin html<cr>
