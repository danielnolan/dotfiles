#!/bin/sh

if [ -z "$USER" ]; then
  USER=$(id -un)
fi

mv /workspaces/.codespaces/.persistedshare/dotfiles $HOME/dotfiles

cd $HOME

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Change shell to zsh
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# Install ag for fast searching
sudo apt-get install -y silversearcher-ag

# Install rcm for Ubuntu > 19
sudo apt-get update
sudo apt-get install -y rcm
yes | rcup -d dotfiles -x README.md -x LICENSE -x Brewfile -x install
