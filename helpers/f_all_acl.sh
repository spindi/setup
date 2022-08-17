#!/home/linuxbrew/.linuxbrew/bin/fish
# services
for service_id in (./f_all_services.sh)
  fastly --token $FASTLY_API_KEY acl list --service-id $service_id --version latest
end
