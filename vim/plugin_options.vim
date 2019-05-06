" commenting
map <leader>c gc

let g:rails_statusline = 1
let g:rails_modelines = 1
let g:rails_no_abbreviations = 1

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'

set completeopt-=longest
set completeopt+=menu
set completeopt+=noinsert
set completeopt+=noselect

let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 1
call deoplete#custom#option({
\ 'auto_complete': v:true,
\ 'smart_case': v:true,
\ })

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

if !exists('g:deoplete#keyword_patterns')
  let g:deoplete#keyword_patterns = {}
endif
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#sources#go#gocode_binary = $GOPATH."/bin/code"
let g:deoplete#sources#go#pointer = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

function! GitFZF()
  let l:git_root = system('git rev-parse --show-toplevel 2> /dev/null')
  call fzf#vim#files(substitute(l:git_root, "\n$", '' ,''))
endfunction
map <leader>t :call GitFZF()<cr>
" let g:fzf_buffers_jump = 1

map <leader>gg :GitGutterToggle<cr>

let g:SuperTabDefaultCompletionType = '<c-n>'
" let g:SuperTabClosePreviewOnPopupClose = 1

let g:sql_type_default = 'pgsql'

let g:ansible_options = {'ignore_blank_lines': 0}

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'

let g:ale_linters = {
\   'javascript': ['standard'],
\   'go': ['golangci-lint'],
\   'eruby': [],
\   'cpp': ['clangtidy'],
\   'python': ['pylint'],
\   'terraform': ['tflint'],
\   'sh': ['shellcheck'],
\}
let g:ale_cpp_clangtidy_checks = []

let g:ale_go_golangci_lint_options = "--fast --exclude-use-default"
let g:ale_go_golangci_lint_package = 1

let g:ale_fixers = {
\   'python': ['black'],
\   'go': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\   'yaml': ['remove_trailing_lines', 'trim_whitespace'],
\   'yaml.ansible': ['remove_trailing_lines', 'trim_whitespace'],
\   'sh': ['shfmt'],
\   'terraform': ['terraform'],
\   'json': ['fixjson'],
\}
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

map <leader>ar :ALEResetBuffer<cr>
map ,n :ALENext<cr>

let g:terraform_fmt_on_save = 0

let g:vim_json_syntax_conceal = 0

let g:ale_lint_on_text_changed = 'always'

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0

let g:neoterm_direct_open_repl = 1
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = ":vert"
vmap <c-\><c-e> :TREPLSend<cr>

let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1
let g:go_fmt_options = {
  \ 'goimports': '-local github.com/avantcredit,github.com/amount',
  \ }

let g:go_metalinter_autosave = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_sameids = 0
