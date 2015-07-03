#!/bin/bash

pushd hadoop
docker build -t centos-hadoop:1.2.1-my .
popd
