#!/bin/bash
source env.sh
docker run \
	--name $CON_HTTPD_NAME \
	-p $CON_HTTPD_PORT \
	-p $CON_HTTPD_PORT_SV_WEB \
	-v $CON_HTTPD_VOL_TMP \
	-v $CON_HTTPD_VOL_HTTPD \
	-v $CON_HTTPD_VOL_LOGS \
	-v $CON_HTTPD_VOL_SV_LOGS \
	-e DNSDOCK_ALIAS=$CON_HTTPD_DNS_NAME \
	-h $CON_HTTPD_DNS_NAME \
	--dns $HOST_IP \
	-d $IMG_HTTPD
