#!/bin/bash

# Start services.sh with passed bootstrap arguments, if executable, and run sepervisord
#echo "$@" >> /var/log/bootstrap.log
if [ -x /etc/services.sh ]; then
	case $1 in
		--bootstrap) 
			shift; /etc/services.sh $@; 
			/usr/bin/supervisord -c /etc/supervisord.conf ;;
		--bootstrap=*) 
			/etc/services.sh ${1#*=} 
			/usr/bin/supervisord -c /etc/supervisord.conf ;;
		*) exec "$@"
	esac
else
	exec "$@"
fi
