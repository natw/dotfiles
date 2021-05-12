function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nmap <buffer> <silent> K <Plug>(lcn-hover)
    nmap <buffer> <silent> gd <Plug>(lcn-definition)

    nmap <buffer> <silent> ,,h <Plug>(lcn-hover)
    " nmap <buffer> <silent> ,,d <Plug>(lcn-definition)
    " nmap <buffer> <silent> ,,d :call LanguageClient#workspace_symbol('.')<cr>
    nmap <buffer> <silent> ,,r <Plug>(lcn-references)
    nmap <buffer> <silent> ,,i <Plug>(lcn-implementation)
    nmap <buffer> <silent> ,,f <Plug>(lcn-implementation)
    nmap <buffer> <silent> ,,t <Plug>(lcn-type-definition)
    nmap <buffer> <silent>
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

let g:LanguageClient_fzfOptions = '--preview "echo {1}"'
let g:LanguageClient_rootMarkers = {
      \ 'elm': ['elm.json'],
      \ 'javascript': ['.flowconfig', 'package.json', 'jsconfig.json'],
      \ 'go': ['go.mod'],
      \ 'rescript': ['package.json', 'bsconfig.json'],
      \ 'python': ['Pipfile', 'setup.cfg'],
      \ 'typescript': ['tsconfig.json']
      \ }

let g:LanguageClient_settingsPath = [expand($VIMHOME)."/settings.json"]

      " \ 'javascript': ['flow', 'lsp'],
      " \ 'javascript.jsx': ['flow', 'lsp'],
      " \ 'go': ['nice', '-n', '18', 'gopls'],
      " \ 'go': ['gopls', "-vv", "-rpc.trace", "--debug=localhost:6060", "--logfile=/tmp/gopls.log"],
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
