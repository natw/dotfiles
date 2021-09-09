scriptencoding utf-8

syntax enable
filetype plugin indent on

let g:ale_sign_highlight_linenrs = 1
runtime plugins.vim

set runtimepath+=$GOROOT/misc/vim

colorscheme railscasts

runtime functions.vim
runtime options.vim
runtime mappings.vim
runtime plugin_options.vim
runtime! other/*.vim
runtime! other/*.lua


augroup markdown_language_client_commands
  autocmd!
  autocmd WinLeave __LanguageClient__ ++nested call <SID>fixLanguageClientHover()
augroup END

function! s:fixLanguageClientHover()
  setlocal modifiable
  setlocal conceallevel=2
  normal i
  setlocal nonu nornu
  setlocal nomodifiable
endfunction

let g:python3_host_prog=$HOME . "/.local/vim-venv/bin/python"

let $VIMHOME=expand('<sfile>:p:h')

function! s:queries()
  lua package.loaded["queries"] = nil
  lua require("queries").queries()
endfunction

nnoremap <silent> <leader>e :call <SID>queries()<cr>
