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
sleep 2
pacman -S --noconfirm neovim alacritty firefox thunar git fish

#Installs LazyVim
echo "Installing LazyVim.."
sleep 2
git clone https://github.com/LazyVim/starter $USER_HOME/.config/nvim
rm -rf $USER_HOME/.config/nvim/.git

#Moves files into .config Dir
echo "Install done, copying files.."
sleep 2

mv ./alacritty $USER_HOME/.config/
mv ./fastfetch $USER_HOME/.config/
mv ./fish $USER_HOME/.config/
mv ./niri $USER_HOME/.config/
mv ./wallpapers $USER_HOME/Pictures/

echo "Done moving files, exiting install.."
sleep 2
