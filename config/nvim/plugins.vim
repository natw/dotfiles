call plug#begin(stdpath('config') . '/bundle')

" colorscheme
Plug 'natw/vim-railscasts'

" Plug '/Users/NatWilliams/projects/nvim-sig-hint'


" completion
" Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

Plug 'seblj/nvim-echo-diagnostics'
Plug 'neovim/nvim-lspconfig'

" Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch': '0.5-compat'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'ojroques/nvim-lspfuzzy'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'

""" markup languages
Plug 'othree/html5.vim'
Plug 'tpope/vim-markdown'
" Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml', { 'branch': 'main' }
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
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-scripts/paredit.vim'
" Plug 'clojure-vim/async-clj-omni'
" Plug 'Olical/conjure'

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
" Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }

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
