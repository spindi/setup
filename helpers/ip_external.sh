#!/bin/bash

if [ $# -eq 0 ]; then
  JSON=`curl -s ifconfig.co/json`
else
  JSON=`curl -s ifconfig.co/json?ip=$1`
fi

echo $JSON
