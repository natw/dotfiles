set nocompatible
filetype off

set rtp+=~/.config/nvim/vundle.vim
call vundle#begin("~/.config/nvim/bundle")


" filetypes
Plugin 'elzr/vim-json'
Plugin 'exu/pgsql.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'wting/rust.vim'
Plugin 'pearofducks/ansible-vim'
" Plugin 'chase/vim-ansible-yaml'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'lambdatoast/elm.vim'

" everything else
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
" Plugin 'rking/ag.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ngmy/vim-rubocop'
Plugin 'simnalamburt/vim-mundo'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'benekastah/neomake'
Plugin 'kassio/neoterm'


call vundle#end()
filetype plugin indent on
