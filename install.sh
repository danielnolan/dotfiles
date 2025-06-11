#!/bin/sh

if [ -z "$USER" ]; then
  USER=$(id -un)
fi

cd $HOME

# remove oh my zsh
~/.oh-my-zsh/tools/uninstall.sh
rm .zshrc
rm .zshenv
rm .zprofile

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Install ripgrep for fast searching
sudo apt-get install ripgrep

# Install rcm for Ubuntu > 19
sudo apt-get update
sudo apt-get install -y yadm
yadm clone -f https://github.com/danielnolan/dotfiles
