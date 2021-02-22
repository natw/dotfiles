if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf*      setlocal filetype=tmux
  au BufNewFile,BufRead *.wsgi                      setlocal filetype=python
  au BufNewFile,BufRead *.json                      setlocal filetype=json
  au BufNewFile,BufRead Capfile                     setlocal filetype=ruby
  au BufNewFile,BufRead Gemfile                     setlocal filetype=ruby
  au BufNewFile,BufRead Vagrantfile                 setlocal filetype=ruby
  au BufNewFile,BufRead *.gemspec                   setlocal filetype=ruby
  au BufNewFile,BufRead *.mkd,*.markdown,*.md       setlocal filetype=markdown
  au BufNewFile,BufRead */*mind_content*.html       setlocal filetype=htmljinja
  au BufNewFile,BufRead */*templates*.html          setlocal filetype=htmljinja
  au BufNewFile,BufRead *.go                        setlocal filetype=go
  au BufNewFile,BufRead *.nim                       setlocal filetype=nim
  au BufNewFile,BufRead *.pp                        setlocal filetype=puppet
  " au BufNewFile,BufRead *.ino                       setlocal filetype=c
  au BufNewFile,BufRead *.d                         setlocal filetype=sh
  au BufNewFile,BufRead *.coffee.erb                setlocal filetype=coffee
  au BufNewFile,BufRead *.scala.html                setlocal filetype=scala
  au BufNewFile,BufRead *.vue                       setlocal filetype=vue
  au BufNewFile,BufRead ~/work/aws_ansible/**/*.yml setlocal filetype=ansible
  au BufRead,BufNewFile */etc/nginx/*               setlocal filetype=nginx
  au BufRead,BufNewFile */usr/local/nginx/conf/*    setlocal filetype=nginx
  au BufRead,BufNewFile nginx.conf                  setlocal filetype=nginx
  au BufRead,BufNewFile ~/.kube/config              setlocal filetype=yaml
  au BufRead,BufNewFile *.hcl                       setlocal filetype=terraform
  au BufRead,BufNewFile *.yaml.gotmpl               setlocal filetype=yaml
  au BufRead,BufNewFile _helpers.tpl                setlocal filetype=gotexttmpl
  au BufRead,BufNewFile *.avsc                      setlocal filetype=json
  au BufRead,BufNewFile go.mod                      setlocal filetype=gomod
  au BufRead,BufNewFile jenkinsfile-*               setlocal filetype=groovy
augroup END
