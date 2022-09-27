#!/home/linuxbrew/.linuxbrew/bin/fish
f /services | jq -r '(.data[] | {id: .id, name: .attributes.name})'
