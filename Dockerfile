FROM microsoft/azure-cli:latest

LABEL AUTHOR Jujhar Singh

ADD run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]