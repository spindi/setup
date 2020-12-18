#!/bin/bash

BLOCKLIST="/Users/${USER}/Setup/squid/block_dns.txt"
BLOCKLIST_TEMP="/tmp/block_dns.txt"

# get adlists
curl -sS -L --compressed 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml&showintro=0&mimetype=plaintext' > ${BLOCKLIST_TEMP}
curl -sS -L --compressed 'https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt' | grep -v '^#' | grep -v ^$ | sed -e 's/.* //' >> ${BLOCKLIST_TEMP}
cat ${BLOCKLIST_TEMP} | sort | uniq > ${BLOCKLIST}
rm -f ${BLOCKLIST_TEMP}

echo Restart Squid to complete
