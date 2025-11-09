#!/bin/sh

if ! command -v starship > /dev/null 2>&1; then
  echo "installing starship"
  if command -v apt > /dev/null 2>&1; then
    sudo apt-get -y install starship
  elif command -v yay > /dev/null 2>&1; then
    yay -S starship
  fi
else
  echo "starship is all ready installed"
fi
