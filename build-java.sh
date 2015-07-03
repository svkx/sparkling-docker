#!/bin/bash

pushd java
docker build -t centos-java:7-my .
popd
