export AWS_REGION=us-east-2
export GOPATH=$HOME/go

export VISUAL="nvim"
export EDITOR="nvim"
export LC_CTYPE=en_US.UTF-8
export LC_TYPE=$LC_CTYPE
export LESS="FSRX"
export HISTFILE=~/.zhistory
export HISTSIZE='100000'
export SAVEHIST='100000'
export WORDCHARS=${WORDCHARS//[\/.]}

export DOCKER_BUILDKIT=1


# for stupid BSD ls (osx)
export LSCOLORS="Dxgxcxdxcxegedabagacad"
# for GNU ls (linux) (I wonder what this looks like)
export LS_COLORS='di=93:fi=0:ln=96:pi=5:so=5:bd=5:cd=5:or=31:mi=31:ex=32'

# setopt null_glob
# expand_kubeconfig() {
#   kcfg=(
#     "$HOME/.kube/config"
#     $HOME/.kube/config.d/*.yml
#     $HOME/.kube/config.d/*.yaml
#   )
#   typeset -U kcf
#   export KUBECONFIG=${(j,:,)kcfg} # the 'j' parameter expansion flag joins arrays.  see `man zshexpn`
# }
# expand_kubeconfig
