#!/bin/bash

# Fix this freaking search parameter in /etc/resolv.cof
echo `grep -v search /etc/resolv.conf` > /etc/resolv.conf

#echo "$@" >> /var/log/services.log

case $1 in
	agent)
		cp /etc/supervisord-agent.conf /etc/supervisord.conf;;
	collector)
		cp /etc/supervisord-collector.conf /etc/supervisord.conf;;
esac


