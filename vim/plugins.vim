call plug#begin('~/.vim/bundle')

Plug '~/projects/vim-syntax-debugging-tools'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'natw/vim-railscasts'

" filetypes
Plug 'othree/html5.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript'
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'tpope/vim-markdown'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }

" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
" Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

"Plug 'lambdatoast/elm.vim'
" Plug 'ElmCast/elm-vim', { 'for': 'elm' }
" Plug 'pbogut/deoplete-elm', { 'for': 'elm' }

Plug 'Shougo/neco-vim', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }

" other langs
Plug 'pearofducks/ansible-vim'
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
" Plug 'OrangeT/vim-csharp'
" Plug 'zah/nim.vim', { 'for': 'nim' }
" Plug 'baabelfish/nvim-nim', { 'for': 'nim' }
" Plug 'lervag/vimtex'
" Plug 'posva/vim-vue'
" Plug 'elixir-lang/vim-elixir'
" Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
" Plug 'reasonml-editor/vim-reason-plus'


" everything else
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-apathy'
" Plug 'kassio/neoterm'
Plug 'junegunn/vim-easy-align'
Plug 'chrisbra/Colorizer'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }


Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/vader.vim'


Plug 'w0rp/ale'

call plug#end()
