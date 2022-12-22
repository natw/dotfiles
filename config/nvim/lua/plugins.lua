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
  use 'nvim-lua/plenary.nvim' -- common utils a lot of things use

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
  -- use 'folke/lsp-colors.nvim' -- dunno if I actually need this atm
  use 'nvim-tree/nvim-web-devicons'
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



  use 'mfussenegger/nvim-dap'



  -- clojure
  -- use 'tpope/vim-fireplace'
  use 'guns/vim-clojure-static' -- dunno if this is actually good, or even has an effect
  use 'junegunn/rainbow_parentheses.vim'
  -- use 'vim-scripts/paredit.vim'
  -- use 'clojure-vim/async-clj-omni'
  use {
    'Olical/conjure',
    ft = {'clojure'},
  }

  use {
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
  }

  -- python
  -- use 'vim-scripts/indentpython.vim', { 'for': 'python' }
  -- use 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
  use {
    'vim-python/python-syntax',
    ft = {'python'},
  }

  -- ruby
  use {
    'vim-ruby/vim-ruby',
    ft = {'ruby'},
  }
  use 'tpope/vim-rails'

  -- go
  -- use {
  --   'fatih/vim-go',
  --   cmd = 'GoUpdateBinaries'
  -- }

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

  use 'vim-test/vim-test'

  -- everything else

  -- use 'vim-airline/vim-airline'
  use 'nvim-lualine/lualine.nvim'
  use 'tpope/vim-commentary'
  use 'mileszs/ack.vim'
  use { 'lewis6991/gitsigns.nvim' }
  use 'nathanaelkane/vim-indent-guides'
  use 'simnalamburt/vim-mundo'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-apathy'
  use 'junegunn/vim-easy-align'

  use {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',
  }

  -- use 'hkupty/iron.nvim'
  -- use 'mtikekar/nvim-send-to-term'

  use '/opt/homebrew/opt/fzf'
  use 'junegunn/fzf.vim'
  -- use 'junegunn/vader.vim'

  use 'dense-analysis/ale' -- I guess this still has some uses?

  -- use '~/src/vim-fuzzy-emoji'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
