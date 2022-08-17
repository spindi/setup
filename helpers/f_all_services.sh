#!/home/linuxbrew/.linuxbrew/bin/fish
f /service | jq -r .[].versions[].service_id | sort -u
