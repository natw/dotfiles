if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setlocal filetype=tmux
    au BufNewFile,BufRead *.wsgi setlocal filetype=python
    au BufNewFile,BufRead *.json setlocal filetype=json
    au BufNewFile,BufRead Capfile setlocal filetype=ruby
    au BufNewFile,BufRead Gemfile setlocal filetype=ruby
    au BufNewFile,BufRead Vagrantfile setlocal filetype=ruby
    au BufNewFile,BufRead *.gemspec setlocal filetype=ruby
    au BufNewFile,BufRead *.mkd,*.markdown,*.md setlocal filetype=markdown
    au BufNewFile,BufRead */*mind_content*.html setlocal filetype=htmljinja
    au BufNewFile,BufRead */*templates*.html setlocal filetype=htmljinja
    au BufNewFile,BufRead *.go setlocal filetype=go
    au BufNewFile,BufRead *.coffee setlocal filetype=coffee
    au BufNewFile,BufRead *.pp setlocal filetype=puppet
    au BufNewFile,BufRead *.ino setlocal filetype=c
    au BufNewFile,BufRead *.d setlocal filetype=sh
    au BufNewFile,BufRead *.coffee.erb setlocal filetype=coffee
    au BufNewFile,BufRead *.scala.html setlocal filetype=scala
augroup END