""""""""" UI

set nocompatible     " vi is a butt
set mouse=a          " let the mouse do stuff (a = in all modes) 
set bs=2             " make backspace work like it should
set autoread         " automatically check for changes to the file
set incsearch        " turn on incremental searching

" F5 toggles search highlighting
map <F5> :set hls!<bar>set hls?<CR>

" ^P toggles paste mode (from insert mode)
map  :set paste!<CR>:set paste?<CR>

" new tab
map ,t :tabnew

" ctrl-h for previous tab
map  gT
" ctrl-L for next tab
map  gt

:command W w

""""""""" DISPLAY

set t_Co=256         " use 256 colors
set background=dark  " dark terminals 4 lyfe
set ttyfast          " optimize for fast terminals
set lazyredraw       " don't redraw while executing macros or that sort of thing
set ruler            " use the ruler.  don't remember exactly what this means
set laststatus=2     " always show the status line
set title            " set window title
set noerrorbells     " DESTROY ALL BELLS
set novisualbell     " 
set t_vb=            " also turns off visual bell?
set showmatch        " highlight matching brackets
set hlsearch         " highlight search term 
set showtabline=1    " only show file tabs when more than one file open

" status line formatting
set statusline=[TYPE=%Y]\ [ENC=%{&fenc}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]
hi StatusLine term=bold,reverse cterm=bold ctermfg=7 ctermbg=0
hi StatusLineNC term=reverse cterm=bold ctermfg=8

" this was something about making the status line dim when it didn't have
" focus.  I dunno, might not work
hi User9 cterm=reverse ctermfg=8 ctermbg=7
au BufEnter * hi User9 ctermfg=7

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


""""""""" OTHER

" taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Inc_Winwidth=0
" toggle taglist window with F6
noremap <silent> <F6> :TlistToggle<CR>

" used for python filetype script when selecting blocks
let g:py_select_leading_comments = 1
let g:py_select_trailing_comments = 1

" use railscast color scheme if using 256 color terminal
if &term == "xterm-256color"
	colorscheme railscasts
endif


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

function! ReRunMINDError()
python << EOF
import vim, os, re
line = vim.current.line
reg = re.compile(r'(\w+)\.(\w+)\(\<Scenario Object: (\S+) \| (\S+) \|.*$')
m = reg.search(line)
mdl = '%s.py' % m.group(1)
fnc = m.group(2)
site = m.group(3)
exp = m.group(4)
cmd = 'nosetests %s:%s --with-csg-site=%s --with-csg-exp=%s' % (mdl, fnc, site, exp)
cmd1 = 'echo "%s"' % cmd
vim.command(':! clear;%s;%s' % (cmd1, cmd))
EOF
endfunction

" map P :call ReRunMINDError()<CR>
