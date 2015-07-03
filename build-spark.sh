#!/bin/bash

pushd spark
docker build -t centos-spark:1.4.0-my .
popd
