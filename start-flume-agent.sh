#!/bin/bash

source env.sh
	
docker run \
	--name=$CON_FLUME_AGENT_NAME \
	-p $CON_FLUME_AGENT_PORT_SV_WEB \
	--volumes-from=$CON_HTTPD_NAME \
	-v $CON_FLUME_AGENT_VOL_FL_LOGS \
	-v $CON_FLUME_AGENT_VOL_SV_LOGS \
	-e DNSDOCK_ALIAS=$CON_FLUME_AGENT_DNS_NAME \
	-h $CON_FLUME_AGENT_DNS_NAME \
	--dns $HOST_IP \
	-d $IMG_FLUME --bootstrap agent
