#!/bin/bash
# use -4 for ipv4 and -6 for ipv6

if [ $# -eq 0 ]; then
  JSON=`curl -s -4 ifconfig.co/json`
else
  JSON=`curl -s -4 ifconfig.co/json?ip=$1`
fi

echo $JSON
