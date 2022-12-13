#!/home/linuxbrew/.linuxbrew/bin/fish
#f /services | jq -r '(.data[] | {id: .id, name: .attributes.name})' # does not support pagination
f '/service?per_page=1000' | jq -r '(.[] | {id: .id, name: .name})'
