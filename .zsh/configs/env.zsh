if [[ -d ~/.1password ]]; then
  export SSH_AUTH_SOCK=~/.1password/agent.sock
fi
