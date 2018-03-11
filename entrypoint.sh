#!/bin/sh

export SSHPASS=$ssh_password;

if [[ -z "$SSHPASS" ]]; then
  echo "No password provided";
  exit 1;
fi

if [[ -z "$@" ]]; then
  echo "No git command provided, so will show status";
  1="status";
fi

sshpass -e git "$@" 
