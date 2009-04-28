" use 256 colors
set t_Co=256

" Basic stuff
set nocompatible
set background=dark
syntax on
filetype on
"filetype plugin indent on
filetype plugin on
filetype indent on
" I don't actually know exactly what these do
set ttyfast
set lz

" 2 = backspace works like it should
set bs=2

" gimmie some nice info at the bottom
set ruler
set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=[TYPE=%Y]\ [ENC=%{&fenc}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]
" reverse video status line is kind of annoying, and gives the screen a white
" border when I switch tabs in iTerm
hi StatusLine term=bold,reverse cterm=bold ctermfg=7 ctermbg=0
hi StatusLineNC term=reverse cterm=bold ctermfg=8

" this was something about making the status line dim when it didn't have
" focus.  I dunno, might not work
hi User9 cterm=reverse ctermfg=8 ctermbg=7
au BufEnter * hi User9 ctermfg=7

" automatically check for changes to the file
set autoread

" set window title
set title

" I hate bells
set noerrorbells
set novisualbell
set t_vb=

" highlight matching brackets
set showmatch

" use railscast color scheme if using 256 color terminal
if &term == "xterm-256color"
	colorscheme railscasts
endif

" searching
set hlsearch
map <F5> :set hls!<bar>set hls?<CR>
set incsearch

map  :set paste!<CR>:set paste?<CR>

" default tab settings
" four space width, hard tabs
set autoindent
"set softtabstop=4
set tabstop=4
set shiftwidth=4
set smarttab
set noexpandtab
set showtabline=1

" taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Inc_Winwidth=0
noremap <silent> <F6> :TlistToggle<CR>

" file encoding stuff
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,shift-jis,iso-8859-1,utf-16,iso-2022-jp,euc-jp,cp932

let g:py_select_leading_comments = 1
let g:py_select_trailing_comments = 1

map ,t :tabnew

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
