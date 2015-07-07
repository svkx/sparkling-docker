#!/bin/bash

# Fix this freaking search parameter in /etc/resolv.cof
echo `grep -v search /etc/resolv.conf` > /etc/resolv.conf

#echo "$@" >> /var/log/services.log

case $1 in
	namenode)
		if [ "$2" == "format" ]; then
			hadoop namenode -format
		fi;
		cp /etc/supervisord-namenode.conf /etc/supervisord.conf;;
	secondarynamenode)
		cp /etc/supervisord-secondarynamenode.conf /etc/supervisord.conf;;
	datanode)
		cp /etc/supervisord-datanode.conf /etc/supervisord.conf;;
esac


