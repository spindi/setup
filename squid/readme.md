# to manage
http://squidman.net/squidman/

# ad servers
# https://calomel.org/squid_adservers.html

# block ad servers dns
acl block_dns dstdom_regex "/Users/conorboyd/Setup/squid/block_dns.txt"
http_access deny block_dns

# block ad servers url
acl block_url url_regex "/Users/conorboyd/Setup/squid/block_url.txt"
http_access deny block_url

