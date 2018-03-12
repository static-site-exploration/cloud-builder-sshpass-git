#!/bin/bash
set -e

# Arguments have not been provided
if [[ -z "$@" ]]; then
  
  echo "No git command provided, so will display git version";
  exec git version;
  
# Switch between plain git and sshpass git based on the existence (or not) of the sshpass envionmnet variable
# Arguments are supplied and the ssh variable is set
elif [[ -n "$@" ]] && [[ -n "$ssh_password" ]]; then

  export SSHPASS=$ssh_password;
  
  echo "Running git with sshpas... ";
  echo "Using parameters: " && echo "$@";
  exec sshpass -e git "$@"

# Arguments are supplied without the ssh variable being set
elif [[ -n "$@" ]] && [[ -z "$ssh_password" ]]; then

  echo "Running git WIHTOUT SSHPASS...";
  echo "Using parameters: " && echo "$@";
  exec git "$@";

else

  echo "Error with git-sshpass";
  exit 1;

fi
