#!/bin/bash

usage()
{
cat << EOF
usage: $0 options

This script stops and removes containers by name
OPTIONS:
   -h          Show this message
   -n <name>   Container name
   -c          Remove container
   -v          Remove conrainer and volume
EOF
}

# Container name to stop
NAME=
# Remove container true/false
CONTAINER=
# Remove volume, associated with container
VOLUME=
while getopts “n:cvh” OPTION
do
	case $OPTION in
		h)
			usage
			exit 1
			;;		
		n)
			NAME=$OPTARG
			;;
		c)
			CONTAINER=1
			;;
		v)
			CONTAINER=1
			VOLUME=1
			;;
		?)
			usage
			exit 1
			;;	
	esac
done

if [ -z $NAME ]; then
     usage
     exit 1
fi

if [ ! -z $CONTAINER ]; then
	docker ps -aq --no-trunc -f "name=${NAME}" -f "status=exited" | while read CID;
	do
		#echo "CID (killed): " $CID
		if [ ! -z $VOLUME ]; then
			echo "REMOVING container and volumes ${CID}"
			docker rm -v $CID
		else
			echo "REMOVING container ${CID}"
			docker rm $CID
		fi
	done
fi

docker ps -q --no-trunc -f "name=${NAME}" | while read CID;
do
	#echo "CID: " $CID
	echo "KILLING container ${CID}"
	docker kill $CID
	if [ ! -z $VOLUME ]; then
		echo "REMOVING container and volumes ${CID}"
		docker rm -v $CID
	elif [ ! -z $CONTAINER ]; then
		echo "REMOVING container ${CID}"
		docker rm $CID
	fi
done
