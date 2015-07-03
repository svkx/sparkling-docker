#!/bin/bash

docker images -aq --no-trunc -f "dangling=true" | while read IID;
do
	echo "REMOVING dangling image ${IID}"
	docker rmi $IID
done
