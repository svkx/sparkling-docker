#!/bin/bash

source env.sh
docker run \
	--name $CON_DNS_NAME \
	-v $CON_DNS_SOCK \
	-p $CON_DNS_PORT \
	-e DNSDOCK_ALIAS=$CON_DNS_DNS_NAME \
	-h $CON_DNS_DNS_NAME \
	--dns $HOST_IP \
	-dt $IMG_DNS
