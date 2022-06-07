scriptencoding utf-8

" set regexpengine=2                    " use new regex engine.  maybe slower sometimes?
" set conceallevel=0                    " show text normally
" set smartindent                       " still smart
" set shiftwidth=2                      " width of line-initial tab, maybe some other stuff
" set shiftround
" set softtabstop=2                     " 2 space tabs (soft)  Tab settings are mostly set in filetype-specfic settings anyway
" set tabstop=2                         " 2 space tabs (hard)
" set expandtab                         " use soft tabs
" set mouse=nv                          " let the mouse do stuff
" set backspace=2                       " make backspace work like it should
" set scrolloff=10                      " rows on either side of the cursor when scrolling
" set splitright                        " open new vertical splits on the right side
" set splitbelow                        " open new horizontal splits on the bottom
" set smartcase                         " case-insensitive searching
" set winwidth=50                       " dumb setting
" set winminwidth=50                    " minimum window width.  makes ^W| useful
" set winheight=16                      " also dumb
" set wildmode=longest,list             " show menu for tab-completion
" set completeopt=menuone               " and just the menu
" set wildignore+=*.pyc                 " don't need dem pyc files
" " set foldmethod=syntax                 " I dunno, maybe this will set up more folds automatically?
" set foldlevelstart=99                 " forces folds open by default
" set foldenable                        " enable fold
" set nojoinspaces                      " don't use two spaces after a . when joining lines
" set grepprg=ag                        " better than grep
" set background=dark                   " dark terminals 4 lyfe
" set lazyredraw                        " don't redraw while executing macros or that sort of thing
" " set ruler                             " use the ruler.
" set title                             " set window title
" set noerrorbells                      " DESTROY ALL BELLS
" set visualbell t_vb=                  " HATE BELLS
" set showmatch                         " highlight matching brackets
" set showtabline=1                     " only show file tabs when more than one file open
" set backupdir=/tmp,/var/tmp,~/tmp     " keep backup files in one place instead of next to the file
" set directory=/tmp,/var/tmp,~/tmp     " directory to keep swap files in
" set number                            " show line numbers
" set listchars=tab:»·,trail:·          " when 'list' option set, show hard tabs and trailing spaces
" set formatoptions=croqlj              " see :h fo-table
" set hlsearch
" set incsearch
" source $VIMRUNTIME/macros/matchit.vim " not on by default for some reason
" set clipboard+=unnamed                " use osx clipboard
" set undodir=/tmp/vim-undo
" set undofile
" " set t_Co=256
" set termguicolors
" set signcolumn=yes                    " don't collapse sign column. To prevent annoying flicker of text moving side to side

source $VIMRUNTIME/macros/matchit.vim " not on by default for some reason
let g:netrw_browsex_viewer= "open"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
