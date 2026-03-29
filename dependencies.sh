#!/bin/bash

#Checks sudo priveleges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo"
  exit 1
fi

#Adds Home_DIR Var
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

#Installs dependencies needed for Dotfiles, assumes that Noctalia-shell is already installed
echo "Installing packages.."
pacman -S --noconfirm neovim alacritty firefox thunar git

#Installs LazyVim
echo "Installing LazyVim.."
git clone https://github.com/LazyVim/starter $USER_HOME/.config/nvim
rm -rf $USER_HOME/.config/nvim/.git

echo "Install done, exiting.."
sleep 2
