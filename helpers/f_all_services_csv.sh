#!/home/linuxbrew/.linuxbrew/bin/fish
#f /services | jq -r '(.data[] | {id: .id, name: .attributes.name})' | jq -r '(.name + ", " + .id)' | sort
f '/service?per_page=1000' | jq '(.[] | .name + ", " + .id)' | sort
