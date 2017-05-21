#!/usr/bin/env zsh

set -e

files=(
    ackrc
    hgrc
    inputrc
    pentadactylrc
    screenrc
    tmux.conf
    vim
    vimrc
    # virtualenvs
    zsh
    zshrc
    irbrc
)
curdir=`pwd`
for fname in $files; do
    ln -s $curdir/$fname $HOME/.$fname
done
