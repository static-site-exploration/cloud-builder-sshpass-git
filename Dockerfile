FROM gcr.io/cloud-builders/git

RUN set -e \

  # Install libraries
  && apt-get update \
  && apt-get -y install sshpass \

  # Cleanup
  && apt-get clean \
  && rm -rf \
          /var/lib/apt/lists/* \
          /var/tmp/* \
          /tmp/* \
          
  # Setup sshpass variable
  && export SSHPASS=$build_ssh_password
 
ENTRYPOINT ["-c", "entrypoint.sh"]
#ENTRYPOINT ["sshpass", "-e", "git"]
#ENTRYPOINT ["sshpass", "-p", "1bigbeer", "git"]
