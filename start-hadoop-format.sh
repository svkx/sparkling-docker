#!/bin/bash

./start-hadoop-namenode-format.sh
sleep 5
./start-hadoop-secondarynamenode.sh
sleep 5
./start-hadoop-datanodes.sh