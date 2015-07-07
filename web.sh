#!/bin/bash

while true; do

  rand=$(((RANDOM % 4) + 1))
  case $rand in
    1) curl http://localhost/one/ ;;
    2) curl http://localhost/two/ ;;
    3) curl http://localhost/three/ ;;
    *) curl http://localhost/ ;;
  esac
  sleep 1

done