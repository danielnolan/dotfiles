#!/bin/sh

if ! command -v zsh > /dev/null 2>&1; then
  echo "installing zsh"
  if command -v apt > /dev/null 2>&1; then
    sudo apt-get install zsh
  elif command -v yay > /dev/null 2>&1; then
    yay -S zsh
  fi
else
  echo "zsh is already installed"
fi
