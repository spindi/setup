https://calomel.org/squid_adservers.html

# Remove ads                                                                                                                                                                                         
acl block_file dstdom_regex "/Users/cboyd/Setup/squid/block_file.txt"                                                                                                                                
http_access deny block_file 
