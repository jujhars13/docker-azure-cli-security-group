FROM microsoft/azure-cli:latest

MAINTAINER Jujhar Singh

ADD run.sh /run.sh

ENTRYPOINT [ "run.sh" ]