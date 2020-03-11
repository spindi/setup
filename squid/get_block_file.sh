#!/bin/bash

curl -sS -L --compressed "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml&showintro=0&mimetype=plaintext" > ~/Setup/squid/block_file.txt 
