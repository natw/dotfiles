""""""""" UI

set nocompatible      " vi is a butt
set mouse=nv          " let the mouse do stuff
set bs=2              " make backspace work like it should
set autoread          " automatically check for changes to the file
set incsearch         " turn on incremental searching
set scrolloff=10      " rows on either side of the cursor when scrolling
set splitright        " open new vertical splits on the right side
set splitbelow        " open new horizontal splits on the bottom
set ignorecase        " case-insensitive searching
set winwidth=50       " dumb setting
set winminwidth=50    " minimum window width.  makes ^W| useful
set winheight=16      " also dumb
set winminheight=16   " minimum window height.  (^W_)
set wildmenu wildmode=longest,list          " show menu for tab-completion
set wildignore+=*.pyc " don't need dem pyc files
" set switchbuf=usetab  " consider tabs when switching between buffers
set foldmethod=syntax " I dunno, maybe this will set up more folds automatically?
set foldlevelstart=99
set nojoinspaces      " don't use two spaces after a . when joining lines
set foldenable        " enable fold
set grepprg=ack       " better than grep
set showcmd           " show the cmdline.  not sure what it does other than show num of lines in visual mode

let javascript_fold=1
let python_highlight_all = 1 " python syntax highlighting stuff
let g:CommandTMatchWindowAtTop = 1 " show command-t window at the top of the screen


" F5 toggles search highlighting
map <F5> :set hls!<bar>set hls?<CR>

" ^P toggles paste mode (from insert mode)
map <C-p> :set paste!<CR>:set paste?<CR>

" ctrl-h for previous tab
map <C-h> gT
" ctrl-L for next tab
map <C-l> gt

map <Leader>r :redraw!<CR>

:command W w
:command Wq wq
:command Q q


map <leader>ff :FufFile<CR>

""""""""" make the numpad work right in xterm-256color term

" the ! makes it work in Insert mode as well
map! <C-[>Op 0
map! <C-[>Oq 1
map! <C-[>Or 2
map! <C-[>Os 3
map! <C-[>Ot 4
map! <C-[>Ou 5
map! <C-[>Ov 6
map! <C-[>Ow 7
map! <C-[>Ox 8
map! <C-[>Oy 9
map! <C-[>OX =

""""""""" DISPLAY

set t_Co=256         " use 256 colors
set background=dark  " dark terminals 4 lyfe
set ttyfast          " optimize for fast terminals
set lazyredraw       " don't redraw while executing macros or that sort of thing
set ruler            " use the ruler.  don't remember exactly what this means
set laststatus=2     " always show the status line
set title            " set window title
set noerrorbells     " DESTROY ALL BELLS
set vb t_vb=         " HATE BELLS
set showmatch        " highlight matching brackets
set hlsearch         " highlight search term
set showtabline=1    " only show file tabs when more than one file open

" status line formatting
set statusline=[TYPE=%Y]\ [ENC=%{&fenc}]\ [LINE=%04l]\ [COL=%04v]\ [%p%%]
hi StatusLine term=bold,reverse cterm=bold ctermfg=7 ctermbg=0
hi StatusLineNC term=reverse cterm=bold ctermfg=8

" this was something about making the status line dim when it didn't have
" focus.  I dunno, might not work
hi User9 cterm=reverse ctermfg=8 ctermbg=7
au BufEnter * hi User9 ctermfg=7

let g:netrw_list_hide = '.*\.pyc$'

""""""""" GUI stuff (MacVim)

if has("gui_running")
    set guifont=Bitstream\ Vera\ Sans\ Mono:h11
    set noanti
    set guioptions=cegm
    set fuopt=maxvert,maxhorz
    set columns=133
    set lines=76
endif


""""""""" HARDCORE SHIT

syntax on            " syntax highlighting
filetype on          "
filetype plugin on   "
filetype indent on   "
set autoindent       " be smart
set smarttab         " also smart
set shiftwidth=4     " width of line-initial tab, maybe some other stuff
set softtabstop=4    " 4 space tabs (soft)
set tabstop=4        " 4 space tabs (hard)
set expandtab        " use soft tabs
set enc=utf-8
set fenc=utf-8
" having utf-16 in fencs seems to hurt more than help
" who the hell uses utf-16 anyway?
" set fencs=utf-8,shift-jis,iso-8859-1,utf-16,iso-2022-jp,euc-jp,cp932
set fencs=utf-8,shift-jis,iso-8859-1,iso-2022-jp,euc-jp,cp932

au BufNewFile,BufRead *.wsgi set filetype=python " highlight .wsgi files like python
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile Capfile set filetype=ruby
au BufRead,BufNewFile Makefile* set noexpandtab " hard tabs in makefiles


let vimclojure#NailgunClient = "/Users/natw/src/vimclojure-2.1.2/ng"
let clj_want_gorilla = 1

map <Leader>re :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rt :tabnew <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rv :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rs :sp <C-R>=expand("%:p:h") . "/" <CR>



""""""""" PYLINT

autocmd FileType python compiler pylint
let g:pylint_onwrite = 0
map <Leader>pl :Pylint<CR>


""""""""" OTHER

" taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' " prob don't need this anymore
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Inc_Winwidth=0
" toggle taglist window with F6
noremap <silent> <F6> :TlistToggle<CR>

" used for python filetype script when selecting blocks
let g:py_select_leading_comments = 1
let g:py_select_trailing_comments = 1

colorscheme railscasts " looks like total ass in non-256 color, but whatevs

" command to remove trailing whitespace
:command Rmsp %s/\s\+$//

" :DiffSaved to see diff of current buffer and version on disk
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

set path+=..

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

