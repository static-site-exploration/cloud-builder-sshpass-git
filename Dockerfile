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
          /tmp/*

ENTRYPOINT ["export SSHPASS=$build_ssh_password", "sshpass", "-e", "git"]
#ENTRYPOINT echo "ssh_pass is" $ssh_pass && sshpass -p $ssh_pass git
