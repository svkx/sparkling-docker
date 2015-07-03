#!/bin/bash

docker ps -aq --no-trunc -f "name=${NAME}" -f "status=exited" | while read CID;
do
	echo "REMOVING container and volumes ${CID}"
	docker rm -v $CID
done