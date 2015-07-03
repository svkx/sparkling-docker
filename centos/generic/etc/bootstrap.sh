#!/bin/bash

# Create /etc/profile.d/env.sh if it doesn't exist
if [ ! -f /etc/profile.d/env.sh ]; then
	echo "#!/bin/bash" > /etc/profile.d/env.sh
fi

# Set DNS alias in env.sh if DNSDOCK_ALIAS is specified
if [ ! -z DNSDOCK_ALIAS ]; then
	echo "export MY_HOSTNAME=${DNSDOCK_ALIAS}" >> /etc/profile.d/env.sh
fi

source /etc/profile.d/env.sh

# Start services.sh with passed bootstrap arguments, if executable, and run sepervisord
echo "$@" >> /var/log/bootstrap.log
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
