#!/bin/sh -eux

mkdir -p ~/.hammerspoon

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/init.lua ~/.hammerspoon/init.lua

