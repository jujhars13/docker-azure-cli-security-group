# Docker Azure Security Group
Quick container to enable Microsoft Azure cloud security group modification.

It will prompt you for `az login` and then proceed to add your ip to the security group in question for the port you specify

```bash
docker run -it -e NAME=mySecGroup -e PORT=6379 jujhars13/azure-cli-security-group
```