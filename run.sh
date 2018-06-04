#!/bin/bash

# 2018-06-04 script to add your current IP address to access a specific 
# $PORT on a security group
# for az cli tools install see https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
#
# to run for your current IP address:
# 		NAME="mySecGroup" PORT=6379 ./azOpenPortOnRg.sh 
# or to run for another IP address:
# 		IP=43.22.33.11 NAME="mySecGroup" PORT=6379 ./azOpenPortOnRg.sh 

if [ -z "$NAME" ]; then
	echo "please supply the Azure resource group \$NAME"
	exit 1
fi

if [ -z "$PORT" ]; then
	echo "please supply the TCP port you wisht to open \$PORT"
	exit 1
fi

if [ -z "$IP" ]; then
	# get ip address
	IP=`curl -s https://ifconfig.io/`
fi

# login first
az login

# does our connection work ?
az network nsg show \
	--name ${NAME} \
	--resource-group ${NAME} \

if [ $? -ne 0 ]; then
	(>&2 echo "error")
	exit 1
fi

az configure --defaults group=${NAME}

# need a friendly IP for the name as it probably won't accept full stops
friendlyIp="$(sed 's/\./_/g' <<< $IP)"

# add rule to ip address
# we'll just use the port number as priority as they cannot be the same for an IP
az network nsg rule create \
	--resource-group ${NAME} \
	--nsg-name ${NAME} \
	--name "a_${PORT}-${friendlyIp}" \
	--access Allow \
	--priority ${PORT} \
	--source-address-prefixes ${IP}/32 --source-port-ranges ${PORT} \
	--destination-address-prefixes '*' --destination-port-ranges ${PORT} \
	--protocol Tcp \
	--description "Allow from ${IP}. Via cli on $(date '+%Y-%m-%d %H:%M:%S')"
