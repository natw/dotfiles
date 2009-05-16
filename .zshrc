# set PATH stuff in .zshenv, Augie says this is a Good Idea

# Basic shell var stuff:

# path for zsh completion functions
export FPATH='/usr/local/share/zsh/site-functions:/usr/local/share/zsh/4.3.9/functions'
export FPATH=$FPATH:~/.zsh/functions
export VISUAL="vim"
export EDITOR="vim"
export LC_CTYPE=en_US.UTF-8
export MANPATH=$MANPATH:/opt/local/share/man

export RUBYOPT=rubygems

# this is all kind of a mess, but it seems to be working ok
# for BSD ls (osx)
export LSCOLORS="Dxgxcxdxcxegedabagacad"
# for GNU ls (linux)
LS_COLORS='di=93:fi=0:ln=96:pi=5:so=5:bd=5:cd=5:or=31:mi=31:ex=32'
export LS_COLORS
# for zsh (I hope)
ZLS_COLORS=$LS_COLORS
export ZLS_COLORS

# history stuff
HISTFILE=~/.zhistory
setopt histignoredups # ignore duplicates.  I don't think this is a real option
HISTSIZE='10000'
SAVEHIST='10000'
WORDCHARS=${WORDCHARS//[\/.]}
setopt extended_history # append history entries w/ timestamp
# setopt hist_save_no_dups
setopt inc_append_history

# in linux, -G just omits the group from -l listing.  gg apple, or bsd, or whomever
case $OSTYPE in
	linux*)
		alias ls='ls --color=auto -Hh'
	;;
	darwin*)
		alias ls='ls -GHh'
	;;
esac
# should be meaningless on other machines, for interacting with Finder
alias cdf='cd "`posd`"'
alias vi='vim'
alias svns='svn status -u'
alias ff='open -a /Applications/Firefox.app "$1"'

alias pgrep='pgrep -fiL'

# fancy renaming
autoload -U zmv
alias mmv='noglob zmv -W'

################
# Key Bindings #
################

# use vim-style line editing
bindkey -v

# pushes the current command to a buffer, lets you do something else, then
# brings you back to what you were doing
bindkey '' push-line # ^P
bindkey '' clear-screen # ^L

# the magic history, just like tcsh has
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# up arrow or ^o will complete the current command based on a history search from most recent back
# ^o because sometimes that up arrow is just so far away
bindkey '\e[A' history-beginning-search-backward-end # up
bindkey '' history-beginning-search-backward-end # ^O
bindkey '\e[B' history-beginning-search-forward-end # down

bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[3~" delete-char # delete

setopt autocd # evaluating a dir name cds to that dir

##############
# COMPLETION #
##############

setopt PROMPT_SUBST
setopt CORRECT
ulimit -c 0
setopt c_bases
setopt autolist

autoload -U compinit
compinit -C

_force_rehash() {
	(( CURRENT ==1 )) && rehash
	return 1
}
zmodload -i zsh/complist

autoload -U zstyle+
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix

local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts

## formatting and messages
zstyle ':completion:*' verbose yes
## describe options presented at completion
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:messages' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for: %d%{\e[0m%}'
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*' group-name ''

## determine in which order the names (files) should be
## listed and completed when using menu completion.
## `size' to sort them by the size of the file
## `links' to sort them by the number of links to the file
## `modification' or `time' or `date' to sort them by the last modification time
## `access' to sort them by the last access time
## `inode' or `change' to sort them by the last inode change time
## `reverse' to sort in decreasing order
## If the style is set to any other value, or is unset, files will be
## sorted alphabetically by name.
zstyle ':completion:*' file-sort name

## case-insensitive (uppercase from lowercase) completion
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
### case-insensitive (all) completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

## ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

## completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zcompcache/$HOST

## add colors to completions
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors $ZLS_COLORS
# zstyle ':completion:*:default' list-colors ''

## don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

## filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.(o|c~|old|pro|zwc|pyc)'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' command 'ps -axco pid,user,command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## the only candidates for completion after 'nosetests' will be .py files
zstyle ':completion:*:*:nosetests:*:*' file-patterns '*.py' 

# commands that have nice --help output and I want to complete arguments for
compdef _gnu_generic nosetests

# if [ "`uname`" = "Darwin" ]; then
#    compctl -f -x 'p[2]' -s "`/bin/ls -d1 /Applications/*/*.app /Applications/*.app | sed 's|^.*/\([^/]*\)\.app.*|\\1|;s/ /\\\\ /g'`" 
# #-- open
#    alias run='open -a'
# fi


#############
# FUNCTIONS #
#############

# this returns the current directory of the topmost finder window
posd() {
thePath="$( osascript<<END
try
	tell application "Finder" to set the source_folder to (folder of the front window) as alias
on error -- no open folder windows
	set the source_folder to path to desktop folder as alias
end try

set thePath to (POSIX path of the source_folder as string)
set result to thePath
END
)"
if [[ -n "${thePath%/*}" ]]; then

	if [[ -d "$thePath" ]]; then
		echo "${thePath%/}"
	else 
		echo "${thePath%/*}"
	fi

else 
	echo "/" 
fi 
}

host_nick='%m'

# precmd is a builtin function that is called before every rendering of the command prompt
precmd() {
	echo -ne "\033]0;${host_nick}: ${PWD/#$HOME/~}\007"
}
precmd

# Function to grab the url of an svn wc
function svnurlof() {
    svn info $1 | grep '^URL: ' | sed 's/URL: //'
}

hgdiff() {
	vimdiff -c 'map q :qa!<CR>' <(hg cat "$1") "$1";
}

##################
# COMMAND PROMPT #
##################

autoload colors
colors
autoload -U promptinit
promptinit

# render machine name in red for root users
if [ "x`whoami`" = "xroot" ]; then
	ucolor=$fg[red]
else
	ucolor=$fg[green]
fi


# define host_nick in .zshrc-machine to override

#######  .ZSHRC-MACHINE INCLUDED HERE
if [[ -a ~/.zshrc-machine ]]; then
	source ~/.zshrc-machine
fi

# put as little as possible after the inclusion of .zshrc-machine
# so things can be overridden

# for some reason, the 'yellow' in the colors hash is darker than the yellow I want
# I didn't even know there was more than one yellow.  I want 1;33
# %~ is long, %. is the short pwd

PS1='%{${fg_bold[white]}%}[%{${ucolor}%}${host_nick} %{${fg[yellow]}%}%~%{${fg[white]}%}]%{${fg[green]}%}%# %{${reset_color}%}'




