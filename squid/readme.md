# to manage
http://squidman.net/squidman/

# ad servers
# https://calomel.org/squid_adservers.html

# get adservers
curl -sS -L --compressed 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml&showintro=0&mimetype=plaintext' > ~/Setup/squid/blocklist.txt
curl -sS -L --compressed 'https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt' | grep -v '^#' | sed -e 's/.* //' > ~/Setup/squid/blocklist.txt

# remove ads - add to the top of the squid conf
acl blocklist dstdom_regex "/Users/conorboyd/Setup/squid/blocklist.txt"
http_access deny blocklist 
