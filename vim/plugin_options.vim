map <leader>c gc

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case' " they say silver_searcher is faster
endif

let g:rails_statusline = 1
let g:rails_modelines = 1
let g:rails_no_abbreviations = 1

map <leader>t :FZF<cr>
" let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

map <leader>gg :GitGutterToggle<cr>

" TODO: make this actually work. SuperTab never gives me what I want
let g:SuperTabDefaultCompletionType = '<c-p>'
let g:SuperTabClosePreviewOnPopupClose = 1

let g:sql_type_default = 'pgsql'

let g:ansible_options = {'ignore_blank_lines': 0}

let g:vimrubocop_rubocop_cmd = "bundle exec rubocop"

let g:ale_linters = {
\   'javascript': ['standard'],
\   'go': ['gofmt', 'golint', 'gosimple', 'go vet', 'staticcheck'],
\   'eruby': [],
\}

let g:terraform_fmt_on_save = 1

let g:vim_json_syntax_conceal = 0

