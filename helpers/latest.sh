#!/bin/bash
DIRECTORY=$1
DATE=$2 # YYYY-MM-DD

usage () {
  echo "latest DIRECTORY [DATE FROM YYYY-MM-DD]"
  exit 1
}

# need a dir
if [ "${DIRECTORY}" = "" ]
then
  usage
fi

# default to yesterday
if [ "${DATE}" = "" ]
then
  DATE=$(date -d "1 day ago" '+%Y-%m-%d')
fi

find ${DIRECTORY} -type f -name "*" \
  -newermt "${DATE}" -printf "%TF %TH:%TM %p\n" | \
  grep -v -e '\.git\/' -e '__pycache__' -e '\.pytest_cache\/' | \
  sort -r
