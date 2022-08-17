#!/home/linuxbrew/.linuxbrew/bin/fish
# f_all_changes - get all of the changes for a date
set GREP_PATTERN $argv[1]

f /services | jq '.data[] | .id,.attributes.name,.attributes.updated_at' | grep $GREP_PATTERN -B 1 -A 1
