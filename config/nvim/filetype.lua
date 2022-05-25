vim.filetype.add({
  extension = {
    ["tmux.conf"] = "tmux",
    ["yaml.gotmpl"] = "yaml",
  },
  filename = {
    ["Capfile"] = "ruby",
    ["Gemfile"] = "ruby",
    ["Vagrantfile"] = "ruby",
    ["~/.kube/config"] = "yaml",
    ["Chart.lock"] = "yaml",

  },
  pattern = {
  },
})

  -- au BufNewFile,BufRead *.go                        setlocal filetype=go
  -- au BufNewFile,BufRead *.nim                       setlocal filetype=nim
  -- au BufNewFile,BufRead *.pp                        setlocal filetype=puppet
  -- " au BufNewFile,BufRead *.ino                       setlocal filetype=c
  -- au BufNewFile,BufRead *.d                         setlocal filetype=sh
  -- au BufNewFile,BufRead *.coffee.erb                setlocal filetype=coffee
  -- au BufNewFile,BufRead *.scala.html                setlocal filetype=scala
  -- au BufNewFile,BufRead *.vue                       setlocal filetype=vue
  -- au BufRead,BufNewFile */etc/nginx/*               setlocal filetype=nginx
  -- au BufRead,BufNewFile */usr/local/nginx/conf/*    setlocal filetype=nginx
  -- au BufRead,BufNewFile nginx.conf                  setlocal filetype=nginx
  -- au BufRead,BufNewFile ~/.kube/config              setlocal filetype=yaml
  -- au BufRead,BufNewFile *.hcl                       setlocal filetype=terraform
  -- au BufRead,BufNewFile *.yaml.gotmpl               setlocal filetype=yaml
  -- au BufRead,BufNewFile _helpers.tpl                setlocal filetype=gotexttmpl
  -- au BufRead,BufNewFile *.avsc                      setlocal filetype=json
  -- au BufRead,BufNewFile go.mod                      setlocal filetype=gomod
  -- au BufRead,BufNewFile jenkinsfile-*               setlocal filetype=groovy
