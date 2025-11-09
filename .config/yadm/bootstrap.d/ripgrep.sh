#!/bin/sh

if ! command -v rg > /dev/null 2>&1; then
  echo "installing ripgrep"
  if command -v apt > /dev/null 2>&1; then
    sudo apt-get install ripgrep
  elif command -v yay > /dev/null 2>&1; then
    yay -S ripgrep
  fi
else
  echo "ripgrep is already installed"
fi
