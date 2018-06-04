FROM microsoft/azure-cli:latest

MAINTAINER Jujhar Singh

ADD run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]