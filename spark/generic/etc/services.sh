#!/bin/bash

# Fix this freaking search parameter in /etc/resolv.cof
echo `grep -v search /etc/resolv.conf` > /etc/resolv.conf

echo "$@" >> /var/log/services.log

case $1 in
	master)
		cp /etc/supervisord-master.conf /etc/supervisord.conf;;
	slave)
		cp /etc/supervisord-slave.conf /etc/supervisord.conf;;
esac


