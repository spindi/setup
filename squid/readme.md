# to manage
http://squidman.net/squidman/

# ad servers
https://calomel.org/squid_adservers.html

# remove ads - add to the top of the squid conf
acl block_file dstdom_regex "/Users/cboyd/Setup/squid/block_file.txt"                                                                                                                                
http_access deny block_file 
