map <leader>c gc

" if executable('ag')
"   let g:ackprg = 'ag --vimgrep --smart-case' " they say silver_searcher is faster
" endif

let g:rails_statusline = 1
let g:rails_modelines = 1
let g:rails_no_abbreviations = 1

set completeopt-=longest
set completeopt+=menu
set completeopt+=noinsert
set completeopt+=noselect
let g:deoplete#enable_at_startup = 0
let g:deoplete#sources#go#gocode_binary = $GOPATH."/bin/code"
let g:deoplete#sources#go#pointer = 1

function! GitFZF()
  let l:git_root = system('git rev-parse --show-toplevel 2> /dev/null')
  call fzf#vim#files(substitute(l:git_root, "\n$", '' ,''))
endfunction
map <leader>t :call GitFZF()<cr>
" let g:fzf_buffers_jump = 1

map <leader>gg :GitGutterToggle<cr>

" TODO: make this actually work. SuperTab never gives me what I want
let g:SuperTabDefaultCompletionType = '<c-n>'
" let g:SuperTabClosePreviewOnPopupClose = 1

let g:sql_type_default = 'pgsql'

let g:ansible_options = {'ignore_blank_lines': 0}

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'

   " 'go': ['gofmt', 'golint', 'gosimple', 'go vet', 'staticcheck',
let g:ale_linters = {
\   'javascript': ['standard'],
\   'go': ['gotype', 'govet'],
\   'eruby': [],
\   'cpp': ['clangtidy'],
\   'python': ['pylint'],
\   'sh': ['shellcheck'],
\}
" let g:ale_go_gometalinter_options = "--fast"
let g:ale_cpp_clangtidy_checks = []

let g:ale_fixers = {
\   'python': ['black'],
\   'go': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\   'sh': ['shfmt'],
\   'json': ['fixjson'],
\}
let g:ale_fix_on_save = 1


" let g:LanguageClient_serverCommands = {
"     \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
"     \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
"     \ }

" let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
" let g:LanguageClient_settingsPath = expand('~') . "/.config/nvim/language_client_settings.json"

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" let g:LanguageClient_windowLogMessageLevel = "Log"
" let g:LanguageClient_loggingFile = "/tmp/lc.log"
" let g:LanguageClient_loggingLevel = "DEBUG"


map <leader>ar :ALEResetBuffer<cr>
map ,n :ALENext<cr>

let g:terraform_fmt_on_save = 1

let g:vim_json_syntax_conceal = 0

" only check on save
let g:ale_lint_on_text_changed = 'always'

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0

let g:neoterm_direct_open_repl = 1
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = ":vert"
vmap <c-\><c-e> :TREPLSend<cr>

" let g:go_fmt_command = "goimports"
" let g:go_fmt_experimental = 1
" let g:go_fmt_fail_silently = 1
" use ALE for fixing
let g:go_fmt_autosave = 0

let g:go_metalinter_autosave = 0
let g:go_metalinter_enabled = []

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:go_def_mode = 'godef'
let g:go_auto_sameids = 0
