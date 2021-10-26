scriptencoding utf-8

syntax enable
filetype plugin indent on

let g:ale_sign_highlight_linenrs = 1
runtime plugins.vim

set runtimepath+=$GOROOT/misc/vim

colorscheme railscasts

runtime options.vim
runtime mappings.vim

let $VIMHOME=expand('<sfile>:p:h')
