#!env bash
source ../install/google-cloud-sdk.sh

DIR=/usr/local/bin
ln -f -s ~/Setup/bigquery/bqc ${DIR}/bqc 
ln -f -s ~/Setup/bigquery/bqv ${DIR}/bqv 
