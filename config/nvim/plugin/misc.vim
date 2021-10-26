let g:python_highlight_all = 1
let g:sql_type_default = 'pgsql'
let g:ansible_options = {'ignore_blank_lines': 0}
let g:vim_json_syntax_conceal = 0

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'go',
      \ 'help'
      \]

let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_palettes = [globpath(&rtp, 'plugin/vim_colorscheme_palette.json')]

nmap <Leader>gu :MundoToggle<CR>

nmap <leader>gg :GitGutterToggle<cr>
