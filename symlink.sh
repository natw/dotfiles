#!/usr/bin/env zsh

set -e

files=(
    .ackrc
    .inputrc
    .screenrc
    .tmux.conf
    .vim
    .vimrc
    .virtualenvs
    .zsh
    .zshrc
)
curdir=`pwd`
for fname in $files; do
    ln -s $curdir/$fname $HOME/$fname
done
