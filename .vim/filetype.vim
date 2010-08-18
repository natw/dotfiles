
augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead *.wsgi set filetype=python
    au BufNewFile,BufRead *.json set filetype=json
    au BufNewFile,BufRead Capfile set filetype=ruby
    au BufRead,BufNewFile *.mkd set filetype=mkd
augroup END

