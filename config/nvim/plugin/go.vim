let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
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
