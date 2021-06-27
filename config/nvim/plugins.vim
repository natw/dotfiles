call plug#begin('~/.config/nvim/bundle')

Plug 'natw/vim-railscasts'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'ojroques/nvim-lspfuzzy'

""" markup languages
Plug 'othree/html5.vim'
Plug 'tpope/vim-markdown'
" Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'jparise/vim-graphql'

""" config
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'pearofducks/ansible-vim'
" Plug 'rodjek/vim-puppet', { 'for': 'puppet' }

""" javascript et al
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Plug 'reasonml-editor/vim-reason-plus'
Plug 'rescript-lang/vim-rescript'
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'posva/vim-vue'

""" clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'scheme'] }
" Plug 'clojure-vim/async-clj-omni'

""" python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
" Plug 'Shougo/neco-vim', { 'for': 'python' }
" Plug 'nvie/vim-flake8', { 'for': 'python' }

""" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
" Plug 'tpope/vim-rails', { 'for': 'ruby' }

""" go
Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }
" Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }

""" other
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'towolf/vim-helm'
" Plug 'keith/swift.vim', { 'for': 'swift' }
" Plug 'OrangeT/vim-csharp'
" Plug 'zah/nim.vim', { 'for': 'nim' }
" Plug 'baabelfish/nvim-nim', { 'for': 'nim' }
" Plug 'lervag/vimtex'
" Plug 'elixir-lang/vim-elixir'
" Plug 'elixir-editors/vim-elixir'
" Plug 'sudar/vim-arduino-syntax'



" everything else
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
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
" Plug 'ervandew/supertab'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/vader.vim'
Plug 'dense-analysis/ale'

" Plug '~/src/vim-fuzzy-emoji'

call plug#end()
