" commenting
map <leader>c gc

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:rails_statusline = 1
let g:rails_modelines = 1
let g:rails_no_abbreviations = 1

let g:python_highlight_all = 1

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'

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

map <leader>t :call GitFZF()<cr>
" let g:fzf_buffers_jump = 1

map <leader>gg :GitGutterToggle<cr>


let g:sql_type_default = 'pgsql'

let g:ansible_options = {'ignore_blank_lines': 0}

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'

let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop'],
\   'javascript': [],
\   'go': ['golangci-lint'],
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

" let g:ale_use_global_executables = 0

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
let g:ale_virtualtext_prefix = '   > '
" let g:ale_virtualtext_delay = 100

let g:ale_cpp_clangtidy_checks = []

let g:ale_go_golangci_lint_options = "--exclude-use-default"
let g:ale_go_golangci_lint_package = 1

" let g:ale_python_pyls_auto_pipenv = 1
" let g:ale_python_pyls_config = {
"       \ 'pyls': {
"       \   'configurationSources': ['flake8'],
"       \ }
"       \}

let g:ale_fixers = {
\   'arduino': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\   'clojure': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\   'elm': ['elm-format'],
\   'go': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['fixjson'],
\   'python': ['isort', 'black'],
\   'sh': ['shfmt'],
\   'javascript': ['prettier-standard', 'remove_trailing_lines', 'trim_whitespace'],
\   'terraform': ['terraform'],
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


let g:terraform_fmt_on_save = 0

let g:vim_json_syntax_conceal = 0


let g:ale_lint_delay = 200
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0

let g:airline_theme = "railscasts"
let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#branch#enabled = 0
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
  \ 'goimports': '-local github.com/amount',
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

let g:go_doc_popup_window = 0
let g:go_def_mode=''
let g:go_info_mode=''
let g:go_referrers_mode=''
let g:go_implements_mode=''
let g:go_rename_command=''
let g:go_gopls_enabled = 0

let g:go_auto_sameids = 0
let g:go_echo_go_info = 0
let g:go_echo_command_info = 0
let g:go_template_use_pkg = 1

" let g:go_debug = ['lsp']

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'go',
      \ 'help'
      \]

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nmap <buffer> <silent> K <Plug>(lcn-hover)
    nmap <buffer> <silent> gd <Plug>(lcn-definition)

    nmap <buffer> <silent> ,,h <Plug>(lcn-hover)
    nmap <buffer> <silent> ,,d <Plug>(lcn-definition)
    nmap <buffer> <silent> ,,r <Plug>(lcn-references)
    nmap <buffer> <silent> ,,i <Plug>(lcn-implementation)
    nmap <buffer> <silent> ,,f <Plug>(lcn-implementation)
    nmap <buffer> <silent> ,,t <Plug>(lcn-type-definition)
  endif
endfunction

autocmd FileType * call LC_maps()

" let g:LanguageClient_loggingLevel = "DEBUG"
" let g:LanguageClient_loggingFile = "/tmp/lsp.txt"

let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsList = "Quickfix"
let g:LanguageClient_completionPreferTextEdit = 1 " experimental
let g:LanguageClient_preferredMarkupKind = ['markdown']
let g:LanguageClient_hideVirtualTextsOnInsert = 1 " don't show errors while I'm still typing
let g:LanguageClient_rootMarkers = {
      \ 'elm': ['elm.json'],
      \ 'javascript': ['.flowconfig', 'package.json', 'jsconfig.json'],
      \ 'go': ['go.mod'],
      \ 'rescript': ['package.json', 'bsconfig.json'],
      \ 'typescript': ['tsconfig.json']
      \ }

let g:LanguageClient_settingsPath = ["~/.vim/settings.json", ".vim/settings.json"]

      " \ 'javascript': ['flow', 'lsp'],
      " \ 'javascript.jsx': ['flow', 'lsp'],
      " \ 'go': ['nice', '-n', '18', 'gopls'],
      " \   'name': 'pyls',
      " \   'command': ['pyls', '--check-parent-process', '-vv', '--log-file', '/tmp/pyls.log'],
      " \ 'typescript': ['typescript-language-server', '--stdio'],
      " \ },
let g:LanguageClient_serverCommands = {
      \ 'go': ['gopls'],
      \ 'elm': ['elm-language-server', '--stdio'],
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ 'rescript': ['~/.vim/bundle-nvim/vim-rescript/rescript-vscode/extension/server/out/server.js', '--node-ipc'],
      \ 'python': ['pyls', '-vv', '--log-file', '/tmp/pyls.log'],
      \ 'terraform': ['terraform-lsp'],
      \ 'vim': ['vim-language-server', '--stdio'],
      \ }

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let tern#is_show_argument_hints_enabled = 1

let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_palettes = [expand($HOME).'/.vim/colorscheme_palette.json']
