#!/bin/bash

pushd httpd
docker build -t centos-httpd:my .
popd
