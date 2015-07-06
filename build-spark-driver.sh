#!/bin/bash

pushd spark-driver
docker build -t centos-spark-driver:0.0.1-my .
popd
