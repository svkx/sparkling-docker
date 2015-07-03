#!/bin/bash

./stop-flume.sh
./stop-hadoop.sh
./stop-httpd.sh
./stop-dns.sh

docker ps -a