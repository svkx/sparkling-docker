#!/bin/bash

./start-hadoop-namenode.sh
sleep 5
./start-hadoop-secondarynamenode.sh
sleep 5
./start-hadoop-datanode2.sh
