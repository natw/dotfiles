setlocal list

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_ruby_rubocop_maker = { 'args': ['-D', '--format', 'emacs'], 'cwd': getcwd() }

let g:neoterm_position = 'vertical'

nmap <space>h :s/:\(\w\+\)\s\+=> /\1: /<cr>
