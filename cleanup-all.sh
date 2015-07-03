#!/bin/bash

./cleanup-containers.sh
./cleanup-images.sh

docker ps -a
docker images