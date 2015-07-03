#!/bin/bash

source env.sh
./stop-container.sh -n $CON_SPARK_MASTER_NAME -v
./stop-container.sh -n $CON_SPARK_SLAVE1_NAME -v
./stop-container.sh -n $CON_SPARK_SLAVE2_NAME -v

