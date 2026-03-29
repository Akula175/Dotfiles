#!/bin/bash

#Installs dependencies needed for Dotfiles, assumes that Noctalia-shell is already installed

pacman -S --noconfirm neovim alacritty firefox thunar

#Installs LazyVim

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "Install Done, exiting..."
sleep 2
