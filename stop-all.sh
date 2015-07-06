#!/bin/bash

./stop-spark-driver.sh
./stop-spark.sh
./stop-flume.sh
./stop-hadoop.sh
./stop-httpd.sh
./stop-dns.sh

docker ps -a
docker images