scriptencoding utf-8

let g:ale_sign_highlight_linenrs = 1
runtime plugins.vim

set runtimepath+=$GOROOT/misc/vim
syntax on
filetype plugin indent on
colorscheme railscasts

runtime functions.vim
runtime options.vim
runtime mappings.vim
runtime plugin_options.vim
runtime! plugins/*.vim


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

let $VIMHOME=expand('<sfile>:p:h')
