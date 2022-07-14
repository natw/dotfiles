vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- colorscheme
  use 'natw/vim-railscasts'

  use 'natw/nvim-hover-doc-url'

  -- completion
  -- use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use 'seblj/nvim-echo-diagnostics'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('nvim-treesitter.install').update()]],
  }

  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'ojroques/nvim-lspfuzzy'
  use 'folke/lsp-colors.nvim'
  use 'folke/trouble.nvim'

  -- markup languages
  use 'othree/html5.vim'
  use 'tpope/vim-markdown'
  -- use 'aklt/plantuml-syntax'
  use 'cespare/vim-toml'
  use 'jparise/vim-graphql'

  -- config
  use 'elzr/vim-json'
  use {
    'hashivim/vim-terraform',
    ft = {'terraform'},
  }
  use 'pearofducks/ansible-vim'

  -- javascript et al
  use 'pangloss/vim-javascript'
  use 'leafgarland/typescript-vim'
  -- use 'reasonml-editor/vim-reason-plus'
  -- use 'rescript-lang/vim-rescript'
  -- use 'kchmck/vim-coffee-script', { 'for': 'coffee' }
  -- use 'posva/vim-vue'

  -- clojure
  -- use 'tpope/vim-fireplace', { 'for': 'clojure' }
  use 'guns/vim-clojure-static'
  use 'junegunn/rainbow_parentheses.vim'
  use 'vim-scripts/paredit.vim'
  -- use 'clojure-vim/async-clj-omni'
  -- use 'Olical/conjure'

  -- python
  -- use 'vim-scripts/indentpython.vim', { 'for': 'python' }
  -- use 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
  use {
    'vim-python/python-syntax',
    ft = {'python'},
  }
  -- use 'Shougo/neco-vim', { 'for': 'python' }
  -- use 'nvie/vim-flake8', { 'for': 'python' }

  -- ruby
  use {
    'vim-ruby/vim-ruby',
    ft = {'ruby'},
  }
  -- use 'ngmy/vim-rubocop', { 'for': 'ruby' }
  -- use 'tpope/vim-rails', { 'for': 'ruby' }

  -- go
  -- use 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }

  -- other
  use {
    'exu/pgsql.vim',
    ft = {'sql'},
  }
  use 'towolf/vim-helm'
  -- use 'keith/swift.vim', { 'for': 'swift' }
  -- use 'OrangeT/vim-csharp'
  -- use 'zah/nim.vim', { 'for': 'nim' }
  -- use 'baabelfish/nvim-nim', { 'for': 'nim' }
  -- use 'lervag/vimtex'
  -- use 'elixir-lang/vim-elixir'
  -- use 'elixir-editors/vim-elixir'
  -- use 'sudar/vim-arduino-syntax'



  -- everything else

  -- use 'vim-airline/vim-airline'
  use 'nvim-lualine/lualine.nvim'
  use 'tpope/vim-commentary'
  use 'mileszs/ack.vim'
  use 'airblade/vim-gitgutter'
  use 'nathanaelkane/vim-indent-guides'
  use 'simnalamburt/vim-mundo'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  -- use 'jceb/vim-orgmode'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-apathy'
  -- use 'kassio/neoterm'
  use 'junegunn/vim-easy-align'
  -- use 'ervandew/supertab'
  use {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',
  }

  use 'hkupty/iron.nvim'

  use '/opt/homebrew/opt/fzf'
  use 'junegunn/fzf.vim'
  -- use 'junegunn/vader.vim'
  use 'dense-analysis/ale'

  -- use '~/src/vim-fuzzy-emoji'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
