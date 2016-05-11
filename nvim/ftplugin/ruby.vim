setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal list

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']

let g:neoterm_position = 'vertical'

nmap <space>h :s/:\(\w\+\)\s\+=> /\1: /<cr>
