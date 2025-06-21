# in linux, -G just omits the group from -l listing.  gg apple, or bsd, or whomever
case $OSTYPE in
    linux*)
        alias ls='ls --color=auto -Hh'
    ;;
    darwin*)
        alias ls='ls -GHh'
    ;;
esac

alias vim=nvim

alias ex=exercism
alias pgrep='pgrep -fil'
alias vimdiff="vimdiff -c 'map q :qa!<CR>'"
alias tf='terraform'

[[ $commands[ggrep] ]] && alias grep=ggrep

alias ksl='kubectl get pods --show-labels'

alias stripcolor='gsed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

[[ $commands[ag] ]] && alias ack=ag  # ag is faster, but I have so much muscle memory around ack
[[ $commands[rg] ]] && alias ack=rg

add_missing_newline() {
  [ -n "$(tail -c1 $1)" ] && echo >> $1    # add trailing newline to last line if missing
}

dos2unix() {
  gsed -i'' 's/\r$//' "$@"
}

# fix() {    # put in ~/bin for scripting reasons
#   for file in "$@"; do
#     [ -n "$(tail -c1 ${file})" ] && echo >> ${file}    # add trailing newline to last line if missing
#     gsed -i'' 's/\r$//' $file                          # convert dos line endings to unix
#   done
# }

# ruby stuff
# alias rc="bin/rails console"
# alias rs="bin/rails server"
alias be="bundle exec"
# alias rg="bundle exec rails generate"
# alias mi="bundle exec rake db:migrate"
# alias ta="tmux attach"
#
alias kc=kubectl
alias kt=kubectx
alias kn=kubens
alias kk="kubectl config get-contexts | awk '/\*/ { print \$2 \"/\" \$5 }'"
# alias hf=helmfile
alias hf='helmfile -e $(kubectl config current-context)'

alias urldecode="python -c \"import sys, urllib as ul; print ul.unquote_plus(sys.stdin.read());\""

gem_cache() {
  gem environment | grep "GEM PATHS" -A 1 | tail -n 1 | awk '{ print $2"/cache" }'
}

# fancy renaming
autoload -U zmv
alias mmv='noglob zmv -W'

alias sc="script/console"
alias ss="script/server"
alias be='bundle exec'

# (( $+commands[gsed] )) && alias sed=gsed # use gsed if it's available

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

function t() { echo | openssl s_client -connect $1:443 -servername ${2:-$1} | openssl x509 -noout -dates }

alias accounts="aws organizations list-accounts --query 'Accounts[].[Name,Id]' --output text | column -t"
# alias dev="sudo /usr/sbin/DevToolsSecurity -enable"

alias listening='sudo lsof -iTCP -sTCP:LISTEN -n -P'

# findip() {
#   aws ec2 describe-subnets --subnet-ids $(aws ec2 describe-network-interfaces --filters "Name=addresses.private-ip-address,Values=$1" | jq '.NetworkInterfaces[0].SubnetId' -r) | jq '.Subnets[0].Tags[] | select(.Key | contains("Name")) | .Value' -r
# }

pk() {
  name=$1
  part1=${name:0:1}
  part2=${name:1:2}
  keydir=${NKEYS_PATH:-$HOME/.nkeys}
  cat "${keydir}/keys/${part1}/${part2}/${name}.nk"
}

gk() {
  env=$1
  keyid=$2
  vault kv get -field "${keyid}" "credentials/nats/${env}/signing_keys"
}

j() {
  local name=$1
  local target="${HOME}/junk/${name}"
  mkdir -p "${target}"
  cd "${target}"
}

ssm() {
  aws ssm start-session --target "$(aws ec2 describe-instances --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value | [0], InstanceId, InstanceType, PrivateIpAddress]' --output text | grep -v "None" | fzf -1 -q "$1" | awk '{print $2}')"
}

preview() {
  spacectl stack preview --id "$1" --sha "$(git rev-parse HEAD)" | tee >(perl -lne '/(https:.+)/ && print $1' | read url && open $url)
}

ap() {
  profile=${1:-}
  if [[ -z "$profile" ]]; then
    profile=$(aws configure list-profiles | fzf)
  fi
  export AWS_PROFILE="$profile"
}

pf() {
  aws ssm start-session \
    --target i-0023f6038859334eb \
    --document-name AWS-StartPortForwardingSessionToRemoteHost \
    --parameters "{\"host\":[\"${1}\"],\"portNumber\":[\"5432\"], \"localPortNumber\":[\"55432\"]}"
}
