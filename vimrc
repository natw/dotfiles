source ~/.vim/vundle_setup.vim

set nocompatible                      " vi is a butt.

set rtp+=$GOROOT/misc/vim
syntax on                             " syntax highlighting
filetype on                           " detect filetypes
filetype plugin on                    " per-filetype plugins
filetype indent on                    " per-filetype indent
colorscheme railscasts                " looks like total ass in non-256 color, but whatevs

set autoindent                        " be smart
set smarttab                          " also smart
set smartindent                       " still smart
set shiftwidth=2                      " width of line-initial tab, maybe some other stuff
set shiftround
set softtabstop=2                     " 2 space tabs (soft)  Tab settings are mostly set in filetype-specfic settings anyway
set tabstop=2                         " 2 space tabs (hard)
set expandtab                         " use soft tabs
set enc=utf-8                         " still don't know, really
set fenc=utf-8                        " same
set fencs=utf-8,shift-jis,iso-8859-1  " I guess these are the ones that I ever actually see
set mouse=nv                          " let the mouse do stuff
set bs=2                              " make backspace work like it should
set autoread                          " automatically check for changes to the file
set incsearch                         " turn on incremental searching
set scrolloff=10                      " rows on either side of the cursor when scrolling
set splitright                        " open new vertical splits on the right side
set splitbelow                        " open new horizontal splits on the bottom
set smartcase                         " case-insensitive searching
set winwidth=50                       " dumb setting
set winminwidth=50                    " minimum window width.  makes ^W| useful
set winheight=16                      " also dumb
set winminheight=10                   " minimum window height.  (^W_)
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildmenu                          " might do nothing because of wildmode
set wildmode=longest,list             " show menu for tab-completion
set completeopt=menu                  " and just the menu
set wildignore+=*.pyc                 " don't need dem pyc files
set foldmethod=syntax                 " I dunno, maybe this will set up more folds automatically?
set foldlevelstart=99                 " forces folds open by default
set nojoinspaces                      " don't use two spaces after a . when joining lines
set foldenable                        " enable fold
set grepprg=ack                       " better than grep
set showcmd                           " show the cmdline. Mostly just useful for showing number of lines in visual mode
set t_Co=256                          " use 256 colors
set background=dark                   " dark terminals 4 lyfe
set ttyfast                           " optimize for fast terminals
set lazyredraw                        " don't redraw while executing macros or that sort of thing
set ruler                             " use the ruler.
set laststatus=2                      " always show the status line
set title                             " set window title
set noerrorbells                      " DESTROY ALL BELLS
set vb t_vb=                          " HATE BELLS
set showmatch                         " highlight matching brackets
set hlsearch                          " highlight search term
set showtabline=1                     " only show file tabs when more than one file open
set backupdir=/tmp,/var/tmp,~/tmp     " keep backup files in one place instead of next to the file
set directory=/tmp,/var/tmp,~/tmp     " directory to keep swap files in
set number                            " show line numbers
set listchars=tab:»·,trail:·          " when 'list' option set, show hard tabs and trailing spaces
set omnifunc=syntaxcomplete#Complete  " use omni completion
set formatoptions=croqlj              " see :h fo-table

set statusline=%f%m\ %y\ [%{&fenc}]\ (%04l/%04L,\ %02v)\ %p%%

set clipboard+=unnamed            " use osx clipboard


""""""""" Plugin Options

source $VIMRUNTIME/macros/matchit.vim      " not on by default for some reason

let javascript_fold = 1                    " javascript syntax folding

let python_highlight_all = 1               " be all that you can be, python.vim
" let python_slow_sync = 1                   " slower, but syntax won't break on triple quoted strings

let NERDSpaceDelims = 1                    " space after # in comments

let g:netrw_list_hide = '.*\.pyc$'

let g:pylint_onwrite = 0

let g:rails_statusline = 1
let g:rails_modelines = 1
let g:rails_no_abbreviations = 1

let g:ctrlp_custom_ignore = {
    \ 'dir': 'eggs$\|\.git$\|env/lib$\|node_modules$\|tmp/cache$\|coverage$\|target$\|env$',
\}
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>t'
let g:ctrlp_switch_buffer = 0

map <leader>gg :GitGutterToggle<cr>

" TODO: make this actually work. SuperTab never gives me what I want
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

let g:sql_type_default = 'pgsql'

let g:ansible_options = {'ignore_blank_lines': 0}



""""""""" mappings and commands

" ^P toggles paste mode (from insert mode)
map <C-p> :set paste!<CR>:set paste?<CR>

" ctrl-h for previous tab
map <C-h> gT
" ctrl-L for next tab
map <C-l> gt

map <Leader>r :redraw!<CR>

" I hit these by mistake a lot
:command! W w
:command! Wq wq
:command! Q q
:command! Vsp vsp

" display the number of occurences of the word under the cursor
map <Leader>wc :%s///gn<CR>

" make the numpad work right in xterm-256color term
map <C-[>Op 0
map <C-[>Oq 1
map <C-[>Or 2
map <C-[>Os 3
map <C-[>Ot 4
map <C-[>Ou 5
map <C-[>Ov 6
map <C-[>Ow 7
map <C-[>Ox 8
map <C-[>Oy 9
map <C-[>OX =

" open files with path relative to current buffer
map <Leader>fe :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>ft :tabnew <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>fv :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>fs :sp <C-R>=expand("%:p:h") . "/" <CR>

" here's some nonsense for debugging syntax highlighting
map <Leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" command to remove trailing whitespace
:command! Rmsp %s/\s\+$//

" I like using ^O for scrolling through completion options
imap <C-o> <C-p>

" undo tree visualization
map <Leader>gu :GundoToggle<CR>

" linewise select previously pasted text
map <Leader>v V`]

" de-uglify json files
map <Leader>jl :%!json_xs -f json -t json-pretty<cr>

" switch to last file
map <Leader><Leader> <C-^>

" search through files of same type as current file
function! FTAckCmd()
    let cmd = ":Ack "
    if (&ft != "")
        let cmd .= "--" . &ft . " "
    endif
    return cmd
endfunction
map <expr> <leader>a FTAckCmd()

nnoremap <silent> <CR> :nohlsearch<CR><CR>

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

map <c-n> :cn<cr>

map ,t :tabnew<cr>

map <leader>d :set spell!<cr>

map q: <nop>

:command! Only :only | :tabonly

map <c-w><c-c> <c-[>

map ,m :make<cr><cr><cr>

map <leader>gb :Gblame<cr>



""""""""" GUI stuff (MacVim)

" override this stuff in a local .gvimrc
if has("gui_running")
    set guioptions=cegm
    set fuopt=maxvert,maxhorz
    set guifont=Bitstream\ Vera\ Sans\ Mono:h11
    set noanti
    set showtabline=2
endif

if has("gui_macvim")
    set macmeta
endif


"""""""" other junk

" adds python path to vim path, so putting the cursor over an import and
" hitting 'gf' should jump to that module
if has("python")
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif
