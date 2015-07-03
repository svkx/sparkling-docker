#!/bin/bash

pushd flume
docker build -t centos-flume:1.6.0-my .
popd
