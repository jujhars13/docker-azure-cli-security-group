# docker-azure-cli-security-group
Quick container to enable Microsoft Azure cloud security group modification.

2018-06-04 script to add your current IP address to access a specific port on a security group from an ip address

```bash
docker run -it -e NAME=mySecGroup -e PORT=6379 jujhars13/azure-cli-security-group
```

It will prompt you for `az login` and then proceed to add your ip to the security group in question for the port you specify