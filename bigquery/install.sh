#!env bash
source ../install/google-cloud-sdk.sh

DIR=/usr/local/bin
sudo ln -f -s ~/Setup/bigquery/bqc ${DIR}/bqc 
sudo ln -f -s ~/Setup/bigquery/bqv ${DIR}/bqv 
