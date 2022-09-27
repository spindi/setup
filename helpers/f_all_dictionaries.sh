#!/home/linuxbrew/.linuxbrew/bin/fish
# services
for service_id in (./f_all_services.sh | jq -r .id)
  f_get_dictionaries $service_id
end
