if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead *.wsgi set filetype=python
    au BufNewFile,BufRead *.json set filetype=json
    au BufNewFile,BufRead Capfile set filetype=ruby
augroup END
