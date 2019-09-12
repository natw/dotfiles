# in linux, -G just omits the group from -l listing.  gg apple, or bsd, or whomever
case $OSTYPE in
    linux*)
        alias ls='ls --color=auto -Hh'
    ;;
    darwin*)
        alias ls='ls -GHh'
    ;;
esac

alias w="cd ~/work"
alias ex=exercism
alias pgrep='pgrep -fil'
alias vimdiff="vimdiff -c 'map q :qa!<CR>'"
alias vimrc='vim -c ":e \$MYVIMRC"'
alias tf='terraform'
alias gs='cd $GOPATH/src/github.com'

alias stripcolor='gsed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

alias ack=ag  # ag is faster, but I have so much muscle memory around ack

[ -x '/usr/local/opt/openssl/bin/openssl' ] && alias openssl=/usr/local/opt/openssl/bin/openssl
[ -x '/usr/local/opt/curl/bin/curl' ] && alias curl=/usr/local/opt/curl/bin/curl

# ruby stuff
alias rc="bundle exec rails console"
alias rs="bundle exec rails server"
alias be="bundle exec"
alias rg="bundle exec rails generate"
alias mi="bundle exec rake db:migrate"
alias ta="tmux attach"

alias kc=kubectl
alias kt=kubectx
alias kn=kubens
alias kk="kubectl config get-contexts | awk '/\*/ { print \$2 \"/\" \$5 }'"
# alias hf=helmfile
alias hf='helmfile -e $(kubectl config current-context)'

alias urldecode="python -c \"import sys, urllib as ul; print ul.unquote_plus(sys.stdin.read());\""

alias vd="VAULT_ADDR=https://vault.dev.amount.com vault"

gem_cache() {
  gem environment | grep "GEM PATHS" -A 1 | tail -n 1 | awk '{ print $2"/cache" }'
}

# fancy renaming
autoload -U zmv
alias mmv='noglob zmv -W'

alias sc="script/console"
alias ss="script/server"
alias be='bundle exec'

(( $+commands[gsed] )) && alias sed=gsed # use gsed if it's available

# cd to the current git or hg repo root
rr() {
    local dir="."
    until ( [[ -d "$dir/.git" ]] || [[ -d "$dir/.hg" ]] ); do
        dir="../$dir"
        if [[ $dir -ef / ]]; then
            return 1
        fi
    done
    cd $dir
}

gl() {
  local target=${1:-./...}
  gometalinter --vendor --tests --fast --enable-gc -Dgotype --aggregate ${target}
}

alias gt='go test -v ./... | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'''


alias pglog="tail -f \"$PGDATA/postgres.log\""

perms() {
  stat -f '%A %a %N' $1
}

test_cf_sni() {
  domain=$1
  cmd="curl --resolve ${domain}:443:\$(dig +short ${domain}.cdn.cloudflare.net | head -1) https://${domain}/ -I"
  echo ${cmd}
  eval ${cmd}
}
