FROM microsoft/azure-cli:2.0.32

LABEL AUTHOR Jujhar Singh

ADD run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]