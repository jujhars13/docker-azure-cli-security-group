FROM microsoft/azure-cli:latest

LABEL maintainer="Jujhar Singh"

ADD run.sh /run.sh

WORKDIR  /

ENTRYPOINT [ "/bin/bash"]

CMD [ "-c", "/run.sh" ]