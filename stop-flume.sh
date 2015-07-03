#!/bin/bash

source env.sh
./stop-container.sh -n $CON_FLUME_AGENT_NAME -v
./stop-container.sh -n $CON_FLUME_COLLECTOR_NAME -v
