#!/bin/sh

if [ -z "$USER" ]; then
  USER=$(id -un)
fi

cd $HOME

# remove oh my zsh
uninstall_oh_my_zsh

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Install ag for fast searching
sudo apt-get install -y silversearcher-ag

# Install rcm for Ubuntu > 19
sudo apt-get update
sudo apt-get install -y rcm
yes | rcup -d dotfiles -x README.md -x LICENSE -x Brewfile -x install
