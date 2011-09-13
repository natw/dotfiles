if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead *.wsgi setlocal filetype=python
    au BufNewFile,BufRead *.json setlocal filetype=json
    au BufNewFile,BufRead Capfile setlocal filetype=ruby
    au BufNewFile,BufRead *.mkd,*.markdown,*.md setlocal filetype=mkd
    au BufNewFile,BufRead */*mind_content*.html setlocal filetype=htmljinja
    au BufNewFile,BufRead */*templates*.html setlocal filetype=htmljinja
augroup END
