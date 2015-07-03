#!/bin/bash

pushd centos
docker build -t centos:6-my .
popd
