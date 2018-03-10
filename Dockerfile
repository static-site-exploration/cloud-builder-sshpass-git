FROM gcr.io/cloud-builders/git

RUN set -e \

  # Install libraries
  && apt-get update && \
  && apt-get -y install sshpass \

  # Cleanup
  && apt-get clean \
  && rm -rf \
          /var/lib/apt/lists/* \
          /var/tmp/* \
          /tmp/* \

ENTRYPOINT ["bash -c 'if [ -z "$ssh_pass" ]; then echo "SSH key is not set, aborting"; exit 1;' ", "$ssh_pass", "-p", "$password", "git"]
