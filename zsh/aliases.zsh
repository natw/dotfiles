# in linux, -G just omits the group from -l listing.  gg apple, or bsd, or whomever
case $OSTYPE in
    linux*)
        alias ls='ls --color=auto -Hh'
    ;;
    darwin*)
        alias ls='ls -GHh'
    ;;
esac

alias pgrep='pgrep -fil'
alias vimdiff="vimdiff -c 'map q :qa!<CR>'"
alias vimrc='vim -c ":e \$MYVIMRC"'
alias tf='terraform'

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

alias urldecode="python -c \"import sys, urllib as ul; print ul.unquote(sys.stdin.read());\""

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
    until ( [[ -a "$dir/.git" ]] || [[ -a "$dir/.hg" ]] ); do
        dir="../$dir"
        if [[ $dir -ef / ]]; then
            return 1
        fi
    done
    cd $dir
}
