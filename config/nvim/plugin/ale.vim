let g:ale_linters = {
\   'go': ['golangci-lint'],
\   'ruby': ['ruby'],
\   'javascript': [],
\   'tex': [],
\   'eruby': [],
\   'cpp': ['clangtidy'],
\   'python': [],
\   'terraform': ['terraform', 'tflint'],
\   'typescript': ['tsserver'],
\   'typescriptreact': ['tsserver'],
\   'elm': [],
\   'clojure': ['clj-kondo'],
\   'sh': ['shellcheck'],
\}

let g:ale_typescript_prettier_use_local_config = 1

highlight ReverseLineNr ctermbg=159 ctermfg=black
hi link ALEErrorSignLineNr ReverseLineNr
hi link ALEStyleErrorSignLineNr ReverseLineNr
hi link ALEWarningSignLineNr ReverseLineNr
hi link ALEStyleWarningSignLineNr ReverseLineNr
hi link ALEInfoSignLineNr ReverseLineNr

let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_warning = '>'
let g:ale_sign_info = '>'
let g:ale_sign_error = '>'
let g:ale_sign_style_error = '>'
let g:ale_sign_style_warning = '>'
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 1
let g:ale_virtualtext_prefix = '   > '
" let g:ale_virtualtext_delay = 100

let g:ale_cpp_clangtidy_checks = []

let g:ale_go_golangci_lint_options = "--exclude-use-default"
let g:ale_go_golangci_lint_package = 1

let g:ale_go_goimports_options = "-local github.com/amount,github.com/natw"

let g:ale_fixers = {
\   'arduino': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\   'go': ['goimports', 'remove_trailing_lines', 'trim_whitespace'],
\   'clojure': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\   'elm': ['elm-format'],
\   'json': ['fixjson'],
\   'python': ['isort', 'black'],
\   'ruby': ['remove_trailing_lines', 'trim_whitespace'],
\   'sh': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['remove_trailing_lines', 'trim_whitespace'],
\   'terraform': ['terraform', 'remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'],
\   'typescriptreact': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'],
\   'vim': ['remove_trailing_lines', 'trim_whitespace'],
\   'rescript': ['refmt', 'remove_trailing_lines', 'trim_whitespace'],
\   'yaml': ['remove_trailing_lines', 'trim_whitespace'],
\   'yaml.ansible': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1

map <leader>ar :ALEResetBuffer<cr>


" map ,n :ALENext<cr>
" nmap <c-n> <Plug>(ale_next_wrap)

let g:ale_lint_delay = 200
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0
