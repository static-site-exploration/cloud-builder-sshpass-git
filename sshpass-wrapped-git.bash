#!/bin/bash
set -e

if [[ -d "$ssh_password" ]]; then

  export SSHPASS=$ssh_password;
  
  if [[ -z "$@" ]]; then
  
    echo "No git command provided, so will use git status";
    1="status";
    
  fi
  
  exec sshpass -e git "$@"

elif [[ -z "$ssh_password" ]]; then

  if [[ -z "$@" ]]; then
  
    echo "No git command provided, so will use git status";
    1="status";
    
  fi
  
  echo "No password provided, so will run git on its own... \n";
  echo "Running Git WIHTOUT SSHPASS! "; 
  echo "Using parameters: " && echo "$@";
  exec git "$@";
  
fi
