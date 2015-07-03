#!/bin/bash

source env.sh
./stop-container.sh -n $CON_HADOOP_NAMENODE1_NAME -v
./stop-container.sh -n $CON_HADOOP_NAMENODE2_NAME -v
./stop-container.sh -n $CON_HADOOP_DATANODE1_NAME -v
./stop-container.sh -n $CON_HADOOP_DATANODE2_NAME -v
