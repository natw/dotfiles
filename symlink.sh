#!/usr/bin/env zsh

set -e

files=(
    ackrc
    inputrc
    tmux.conf
    vim
    zsh
    zshrc
    irbrc
)
curdir=`pwd`
for fname in $files; do
    ln -s $curdir/$fname $HOME/.$fname
done
