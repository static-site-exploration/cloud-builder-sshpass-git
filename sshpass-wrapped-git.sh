#!/bin/sh

if [[ -d "$SSHPASS" ]]; then

  export SSHPASS=$ssh_password;
  
  if [[ -z "$@" ]]; then
  
    echo "No git command provided, so will use git status";
    1="status";
    
  fi
  
  exec sshpass -e git "$@"

elif [[ -z "$SSHPASS" ]]; then

  echo "No password provided, so will run git without sshpass... \n";
  echo "RUNNING GIT ONLY! >>> "; 
  exec git "$@";
  
fi
