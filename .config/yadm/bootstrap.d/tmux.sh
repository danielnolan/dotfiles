#!/bin/sh

if ! command -v tmux > /dev/null 2>&1; then
  echo "installing tmux"
  if command -v apt > /dev/null 2>&1; then
    sudo apt-get install tmux
  elif command -v yay > /dev/null 2>&1; then
    yay -S tmux
  fi
else
  echo "tmux is all ready installed"
fi
