#!/bin/bash

source env.sh
./stop-container.sh -n $CON_SPARK_DRIVER_NAME -v
