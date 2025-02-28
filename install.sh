#!/bin/sh

if [ -z "$USER" ]; then
  USER=$(id -un)
fi

cd $HOME

# remove oh my zsh
uninstall_oh_my_zsh

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Set default shell to zsh in devcontainer
sudo chsh -s /bin/zsh vscode

# Install ripgrep for fast searching
sudo apt-get install ripgrep

# Install rcm for Ubuntu > 19
sudo apt-get update
sudo apt-get install -y rcm
yes | rcup -d dotfiles -x README.md -x LICENSE -x Brewfile -x install
