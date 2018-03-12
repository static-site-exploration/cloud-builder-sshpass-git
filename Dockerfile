FROM gcr.io/cloud-builders/git

RUN set -e \

  # Install libraries
  && apt-get update \
  && apt-get -y install sshpass \
  && apt-get -y install expect \

  # Cleanup
  && apt-get clean \
  && rm -rf \
          /var/lib/apt/lists/* \
          /var/tmp/* \
          /tmp/*
          
ADD sshpass-wrapped-git.bash /sshpass-wrapped-git.bash

RUN chmod +x /sshpass-wrapped-git.bash

ENTRYPOINT ["/sshpass-wrapped-git.bash"]
