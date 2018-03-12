#!/bin/bash
set -e

# Arguments have not been provided
if [ -z "$@" ]; then
  
  echo "No command provided, so will display git version";
  exec git version;

# Test ssh with sshpass
elif [ $1 == "ssh" ] && [ $2 == "sshpass" ] && [ -n "$ssh_password" ]; then
  
  exec sshpass -p $ssh_password ssh git@gitub.com;

# Test ssh without sshpass
elif [ "$1" == "ssh" ] && [ - z "$2" ] && [ -n "$ssh_password" ]; then
  
  ssh git@gitub.com;

# Switch between plain git and sshpass git based on the existence (or not) of the sshpass envionmnet variable
# Arguments are supplied and the ssh variable is set
elif [ -n "$@" ] && [ -n "$ssh_password" ]; then

# export SSHPASS=$ssh_password;
  
  echo "Running git with sshpas... " && echo "Using parameters: " && echo "$@";
  exec sshpass -p $ssh_password git "$@";
# exec -e git "$@";

# Arguments are supplied without the ssh variable being set
elif [ -n "$@" ] && [ -z "$ssh_password" ]; then

  echo "Running git with sshpas... " && echo "Using parameters: " && echo "$@";
  echo "Using parameters: " && echo "$@";
  exec git "$@";

else

  echo "Error with git-sshpass";
  exit 1;

fi
