if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead *.wsgi set filetype=python
    au BufNewFile,BufRead *.json set filetype=json
    au BufNewFile,BufRead Capfile set filetype=ruby
    au BufNewFile,BufRead *.mkd set filetype=mkd
    au BufNewFile,BufRead *.markdown set filetype=mkd
    au BufNewFile,BufRead */*mind_content*.html set filetype=htmljinja
augroup END
