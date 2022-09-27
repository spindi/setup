#!/home/linuxbrew/.linuxbrew/bin/fish
set SERVICE_ID $argv[1]

# versions
#for service_id_version in (f /service/$service_id/version | jq .[].number | tail -n 1)
for service_id_version in (f /service/$SERVICE_ID/version | jq .[].number)
  # dictionaries
  for dictionary in (f /service/$SERVICE_ID/version/$service_id_version/dictionary)
    echo "{ \"service_id\": \"$SERVICE_ID\", \"service_id_version\": \"$service_id_version\" }"
    echo $dictionary
  end
end
