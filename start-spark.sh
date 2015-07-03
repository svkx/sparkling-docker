#!/bin/bash

./start-spark-master.sh
sleep 5
./start-spark-slaves.sh
