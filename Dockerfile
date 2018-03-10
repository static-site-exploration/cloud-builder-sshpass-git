FROM gcr.io/cloud-builders/git

RUN apt-get update && \
  apt-get -y install sshpass
  
ARG passphrase
ENTRYPOINT ["sshpass -p $passphrase git"]
