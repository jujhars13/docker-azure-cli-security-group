# Docker Azure Security Group
Quick container to enable Microsoft Azure cloud security group modification.

It will prompt you for `az login` and then proceed to add your ip to the security group in question for the port you specify.
```bash
docker run -it \
-e NAME=mySecGroup -e PORT=6379 \
jujhars13/azure-cli-security-group
```

Used to access servers on the fly.

## Optional Env Variables

```bash
IP=<the ip address you want to unlock, otherwise it will curl myIP.co to get it>
SUBS_ID=<the specific azure subscription id, if you want to override default>
```

## Notes
The script will run `az login` so make sure you're logged into your Azure account as it will prompt you for an interactive "oauthy" browser login flow