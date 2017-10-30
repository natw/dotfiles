call plug#begin('~/.vim/bundle')

" filetypes
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'othree/html5.vim'
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'pearofducks/ansible-vim'
" Plug 'chase/vim-ansible-yaml'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
"Plug 'lambdatoast/elm.vim'
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
" Plug 'OrangeT/vim-csharp'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'vim-airline/vim-airline'

" everything else
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-repeat'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vader.vim'

Plug 'w0rp/ale'

call plug#end()
