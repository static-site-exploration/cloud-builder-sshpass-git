#!/bin/bash
set -e

# Check if any arguments have been provided
if [[ -z "$@" ]]; then
  
  echo "No git command provided, so will use git status";
  exec git status;

else

  echo "Using parameters: " && echo "$@";
  
  # Switch between plain git and sshpass git based on the existence (or not) of the sshpass envionmnet variable
  if [[ -d "$ssh_password" ]] && [[ -d "$@" ]]; then

    export SSHPASS=$ssh_password;

    echo "Running git with sshpas... "; 
    exec sshpass -e git "$@"

  elif [[ -z "$ssh_password" ]] && [[ -d "$@" ]]; then

    echo "Running git WIHTOUT SSHPASS..."; 
    exec git "$@";
  
  else
  
    echo "Error with git-sshpass";
    exit 1;

  fi

fi
